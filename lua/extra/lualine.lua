return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  config = function()
    local function imode()
      if vim.o.iminsert == 1 then
        return 'ru'
      else
        return 'en'
      end
    end
    require('lualine').setup {
      options = {
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
        -- component_separators = { left = '', right = '' },
        ignore_focus = { 'NvimTree' },
        -- theme = 'solarized',
      },
      sections = {
        lualine_a = { imode },
        lualine_b = {
          'branch',
        },
        lualine_c = {
          {
            'filename',
            path = 4,
          },
          'diff',
          'diagnostics',
        },
        lualine_x = { 'encoding', 'fileformat', { 'filetype', icon_only = true } },
        lualine_y = { 'progress' },
        --   lualine_c = {
        --     'filename',
        --     'diagnostics',
        --     {
        --       'navic',
        --       -- Component specific options
        --       color_correction = nil, -- Can be nil, "static" or "dynamic". This option is useful only when you have highlights enabled.
        --       -- Many colorschemes don't define same backgroud for nvim-navic as their lualine statusline backgroud.
        --       -- Setting it to "static" will perform a adjustment once when the component is being setup. This should
        --       --   be enough when the lualine section isn't changing colors based on the mode.
        --       -- Setting it to "dynamic" will keep updating the highlights according to the current modes colors for
        --       --   the current section.
        --       navic_opts = nil, -- lua table with same format as setup's option. All options except "lsp" options take effect when set here.
        --     },
        --   },
      },
      extensions = { 'aerial', 'quickfix', 'man', 'fugitive', 'nvim-tree', 'mundo' },
    }
  end,
}
