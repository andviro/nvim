return {
  -- NOTE: First, some plugins that don't require any configuration
  'nvim-lua/plenary.nvim',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Detect file encoding
  's3rvac/AutoFenc',
  {
    'stevearc/stickybuf.nvim',
    opts = {},
  },
  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
      local highlight = {
        "NonText",
        "Whitespace",
      }
      require("ibl").setup {
        indent = { highlight = highlight, char = "┊" },
        debounce = 100,
        whitespace = {
          highlight = highlight,
          remove_blankline_trail = false,
        },
        scope = {
          show_start = false,
          show_end = false,
        },
      }
    end
  },
  --
  -- {
  --   'ThePrimeagen/git-worktree.nvim',
  --   dependencies = {
  --     'nvim-telescope/telescope.nvim',
  --   },
  -- },

  { 'ellisonleao/glow.nvim', config = true, cmd = 'Glow' },

  { 'mbbill/undotree' },

  {
    'vim-pandoc/vim-pandoc',
    dependencies = {
      'vim-pandoc/vim-pandoc-syntax',
    },
  },

  -- enhanced autchdir
  'fmoralesc/vim-extended-autochdir',

  -- Highlight CSV columns
  'mechatroner/rainbow_csv',
  {
    'AntonVanAssche/music-controls.nvim',
    dependencies = {
      'rcarriga/nvim-notify',
    },
  },
}
