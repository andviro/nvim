return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',  -- required
    'sindrets/diffview.nvim', -- optional - Diff integration
    -- 'nvim-telescope/telescope.nvim',
  },
  config = function()
    local neogit = require 'neogit'
    neogit.setup {}
    vim.keymap.set('n', '<leader>gs', neogit.open, { silent = true, noremap = true, desc = 'Neogit [s]tatus' })
    vim.keymap.set('n', '<leader>ga', '<cmd>silent !git add %<cr>',
      { silent = true, noremap = true, desc = 'Git [a]dd current file' })
    vim.keymap.set('n', '<leader>gc', require('neogit').action('commit', 'commit', { '--verbose' }),
      { silent = true, noremap = true, desc = 'Neogit [c]ommit' })
    vim.keymap.set('n', '<leader>gC', require('neogit').action('commit', 'commit', { '--verbose', '--all' }),
      { silent = true, noremap = true, desc = 'Neogit [C]ommit --all' })
    vim.keymap.set('n', '<leader>gu', require('neogit').action('pull', 'from_upstream', {}),
      { silent = true, noremap = true, desc = 'Neogit p[u]ll' })
    vim.keymap.set('n', '<leader>gp', require('neogit').action('push', 'to_upstream', {}),
      { silent = true, noremap = true, desc = 'Neogit [p]ush' })
    -- vim.keymap.set('n', '<leader>gu', ':Neogit pull<CR>', { silent = true, noremap = true, desc = 'Neogit p[u]ll' })
    -- vim.keymap.set('n', '<leader>gp', ':Neogit push<CR>', { silent = true, noremap = true, desc = 'Neogit [p]ush' })
    -- vim.keymap.set('n', '<leader>gb', ':FzfLua git_branches<CR>', { silent = true, noremap = true, desc = 'Neogit [b]ranches' })
    -- vim.keymap.set('n', '<leader>gB', ':G blame<CR>', { silent = true, noremap = true, desc = 'Git [B]lame' })
  end,
}
