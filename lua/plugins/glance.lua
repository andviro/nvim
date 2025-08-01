return {
  'dnlhc/glance.nvim',
  keys = {
    { '<Leader><CR>', '<cmd>Glance references<CR>', desc = 'Symbol references' },
  },
  config = function()
    require('glance').setup {
      theme = { -- This feature might not work properly in nvim-0.7.2
        enable = true, -- Will generate colors for the plugin based on your current colorscheme
        mode = 'darken', -- 'brighten'|'darken'|'auto', 'auto' will set mode based on the brightness of your colorscheme
      },
      border = {
        enable = false, -- Show window borders. Only horizontal borders allowed
      },
    }
  end,
}
