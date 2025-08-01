return {
  'echasnovski/mini.files',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  version = '*',
  keys = {
    { '<Leader><Tab>', '<cmd>lua MiniFiles.open()<cr>', desc = 'Open minifiles' },
  },
  config = function()
    require('mini.files').setup {
      windows = {
        preview = true,
        -- Width of preview window
        width_preview = 73,
      },
      mappings = {
        -- close = 'q',
        -- go_in = 'l',
        -- go_in_plus = '<CR>',
        -- go_out = 'h',
        -- go_out_plus = 'H',
        go_in = '',
        go_in_plus = '<CR>',
        go_out = '',
        go_out_plus = 'H',
        -- reset = '<BS>',
        -- reveal_cwd = '@',
        -- show_help = 'g?',
        -- synchronize = '=',
        -- trim_left = '<',
        -- trim_right = '>',
      },
    }
  end,
}
