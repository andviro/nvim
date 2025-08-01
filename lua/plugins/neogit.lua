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
    vim.keymap.set('n', '<leader>gc', ':Neogit commit<CR>', { silent = true, noremap = true, desc = 'Neogit [c]ommit' })
    vim.keymap.set('n', '<leader>gu', ':Neogit pull<CR>', { silent = true, noremap = true, desc = 'Neogit p[u]ll' })
    vim.keymap.set('n', '<leader>gp', ':Neogit push<CR>', { silent = true, noremap = true, desc = 'Neogit [p]ush' })
    vim.keymap.set('n', '<leader>gb', ':FzfLua git_branches<CR>',
      { silent = true, noremap = true, desc = 'Neogit [b]ranches' })
    vim.keymap.set('n', '<leader>gB', ':G blame<CR>', { silent = true, noremap = true, desc = 'Git [B]lame' })
  end,
}
