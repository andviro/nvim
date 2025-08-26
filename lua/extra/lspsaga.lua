return {
  'nvimdev/lspsaga.nvim',
  event = { 'LspAttach' },
  keys = {
    { '<Leader><CR>', '<cmd>Lspsaga finder<CR>',                     desc = 'Symbol references' },
    { '<Leader>a',    '<cmd>Lspsaga code_action<CR>',                desc = 'Code [A]ctions' },
    { '<Leader>q',    '<cmd>Lspsaga show_workspace_diagnostics<CR>', desc = 'workspace diagnosti[q]s' },
  },
  config = function()
    require('lspsaga').setup {
      outline = {
        keys = {
          toggle_or_jump = '<CR>',
        },
      },
      diagnostic = {
        show_code_action = true,
      },
      symbols_in_winbar = {
        enable = true,
      },
      lightbulb = {
        enable = false,
        sign = false,
      },
      finder = {
        max_height = 0.6,
        left_width = 0.2,
        keys = {
          toggle_or_open = '<CR>',
        },
      },
      implement = {
        enable = true,
      },
    }
  end,
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- optional
    'nvim-tree/nvim-web-devicons',     -- optional
  },
}
