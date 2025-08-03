return {
  'L3MON4D3/LuaSnip',
  dependencies = {
    'rafamadriz/friendly-snippets',
    'stevearc/vim-vscode-snippets',
    'rafamadriz/friendly-snippets',
    'stevearc/vim-vscode-snippets',
  },
  event = 'InsertEnter *',
  config = function()
    local ls = require 'luasnip'
    local vsc = require 'luasnip.loaders.from_vscode'
    local lua = require 'luasnip.loaders.from_lua'

    ls.setup {
      snip_env = {
        s = require('luasnip.nodes.snippet').S,
        sn = require('luasnip.nodes.snippet').SN,
        t = require('luasnip.nodes.textNode').T,
        f = require('luasnip.nodes.functionNode').F,
        i = require('luasnip.nodes.insertNode').I,
        c = require('luasnip.nodes.choiceNode').C,
        d = require('luasnip.nodes.dynamicNode').D,
        r = require('luasnip.nodes.restoreNode').R,
        l = require('luasnip.extras').lambda,
        rep = require('luasnip.extras').rep,
        p = require('luasnip.extras').partial,
        m = require('luasnip.extras').match,
        n = require('luasnip.extras').nonempty,
        dl = require('luasnip.extras').dynamic_lambda,
        fmt = require('luasnip.extras.fmt').fmt,
        fmta = require('luasnip.extras.fmt').fmta,
        conds = require 'luasnip.extras.expand_conditions',
        types = require 'luasnip.util.types',
        events = require 'luasnip.util.events',
        parse = require('luasnip.util.parser').parse_snippet,
        ai = require 'luasnip.nodes.absolute_indexer',
      },
    }

    ls.config.set_config { history = true, updateevents = 'TextChanged,TextChangedI' }

    -- load friendly-snippets
    vsc.lazy_load()
    -- load lua snippets
    lua.load { paths = os.getenv 'HOME' .. '/.config/nvim/snippets/' }

    -- expansion key
    -- this will expand the current item or jump to the next item within the snippet.
    -- vim.keymap.set({ 'i', 's' }, '<C-l>', function()
    --   if ls.expand_or_jumpable() then
    --     ls.expand_or_jump()
    --   end
    -- end, { silent = true })
    --
    -- -- jump forwards key.
    -- vim.keymap.set({ 'i', 's' }, '<Tab>', function()
    --   if ls.jumpable(1) then
    --     ls.jump(1)
    --   end
    -- end, { silent = true })
    --
    -- -- jump backwards key.
    -- -- this always moves to the previous item within the snippet
    -- vim.keymap.set({ 'i', 's' }, '<S-Tab>', function()
    --   if ls.jumpable(-1) then
    --     ls.jump(-1)
    --   end
    -- end, { silent = true })
    --
    -- -- selecting within a list of options.
    -- vim.keymap.set('i', '<c-h>', function()
    --   if ls.choice_active() then
    --     ls.change_choice(1)
    --   end
    -- end)
  end,
}
