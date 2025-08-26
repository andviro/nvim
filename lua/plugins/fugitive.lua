return {
  'tpope/vim-fugitive',
  config = function()
    local map = vim.keymap.set
    map('n', '<leader>gs', '<cmd>Git<cr>', { desc = 'Git status' })
    map('n', '<leader>ga', '<cmd>Git add %<cr>', { desc = 'Git add buffer' })
    map('n', '<leader>gA', '<cmd>Git add -A .<cr>', { desc = 'Git add all' })
    map('n', '<leader>gB', '<cmd>GitBlameToggle<cr>', { desc = 'Toggle Blame' })
    map('n', '<leader>gc', '<cmd>Git commit -v<cr>', { desc = 'Git commit' })
    map('n', '<leader>gC', '<cmd>Git commit -a -v<cr>', { desc = 'Git commit -a' })
    map('n', '<leader>gp', '<cmd>Git push -u origin HEAD<cr>', { desc = 'Git push' })
    map('n', '<leader>gu', '<cmd>Git pull<cr>', { desc = 'Git pull' })
  end,
}
