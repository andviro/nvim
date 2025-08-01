return {
  -- Autocompletion
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'f3fora/cmp-spell',
    'hrsh7th/cmp-calc',
    'lukas-reineke/cmp-rg',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'onsails/lspkind.nvim',
  },
  lazy = false,
  config = function()
    -- Setup nvim-cmp.
    local luasnip = require 'luasnip'
    local cmp = require 'cmp'
    local lspkind = require 'lspkind'
    local feedkeys = require 'cmp.utils.feedkeys'
    local keymap = require 'cmp.utils.keymap'
    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
    end

    cmp.setup {
      formatting = {
        format = lspkind.cmp_format {
          with_text = false,
          maxwidth = 50,
          mode = 'symbol',
          menu = {
            buffer = 'BUF',
            rg = 'RG',
            nvim_lsp = 'LSP',
            path = 'PATH',
            luasnip = 'SNIP',
            calc = 'CALC',
            spell = 'SPELL',
          },
        },
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-u>'] = cmp.mapping.scroll_docs(4),
        -- ["<C-Space>"] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        ['<C-j>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<Down>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<C-k>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<Up>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            local entry = cmp.get_selected_entry()
            if not entry then
              cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
            else
              cmp.confirm()
            end
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { 'i', 's' }),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- { name = 'nvim_lsp_signature_help' },
        { name = 'luasnip' },
      }, {
        { name = 'buffer', keyword_length = 5 },
        { name = 'path' },
        -- { name = 'calc' },
        -- { name = 'spell', keyword_length = 5 },
        -- { name = 'rg', keyword_length = 5 },
      }),
    }

    local cmd_mappings = {
      ['<C-n>'] = {
        c = function()
          feedkeys.call(keymap.t '<Down>', 'n')
        end,
      },
      ['<C-p>'] = {
        c = function()
          feedkeys.call(keymap.t '<Up>', 'n')
        end,
      },
      ['<C-e>'] = {
        c = function()
          feedkeys.call(keymap.t '<End>', 'n')
        end,
      },
      ['<C-a>'] = {
        c = function()
          feedkeys.call(keymap.t '<Home>', 'n')
        end,
      },
      ['<C-b>'] = {
        c = function()
          feedkeys.call(keymap.t '<Left>', 'n')
        end,
      },
      ['<C-f>'] = {
        c = function()
          feedkeys.call(keymap.t '<Right>', 'n')
        end,
      },
      ['<C-g>'] = {
        c = cmp.mapping.close(),
      },
      ['<C-j>'] = {
        c = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end,
      },
      ['<C-k>'] = {
        c = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end,
      },
    }

    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(cmd_mappings),
      sources = {
        { name = 'buffer' },
      },
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(cmd_mappings),
      sources = cmp.config.sources({
        { name = 'path' },
      }, {
        { name = 'cmdline' },
      }),
    })
  end,
}
