return {
  'rmagatti/auto-session',
  config = function()
    local auto_session = require 'auto-session'

    auto_session.setup {
      auto_restore_enabled = false,
      auto_session_suppress_dirs = { '~/', '~/tmp', '~/Dev/', '~/Downloads', '~/Documents', '~/Desktop/' },
    }

    local keymap = vim.keymap

    keymap.set('n', '<leader>we', '<cmd>SessionRestore<CR>', { desc = 'R[e]store session for cwd' }) -- restore last workspace session for current directory
    keymap.set('n', '<leader>ws', '<cmd>SessionSave<CR>', { desc = '[S]ave session for auto session root dir' }) -- save workspace session for current working directory
  end,
}
