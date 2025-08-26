return {
  "sschleemilch/slimline.nvim",
  opts = {
    style = 'fg',
    bold = false,
    hl = {
      secondary = 'Comment',
    },
    configs = {
      mode = {
        hl = {
          normal = 'Type',
          visual = 'Keyword',
          insert = 'Function',
          replace = 'Statement',
          command = 'String',
          other = 'Function',
        },
      },
      path = {
        hl = {
          primary = 'Label',
        },
      },
      git = {
        hl = {
          primary = 'Function',
        },
      },
      filetype_lsp = {
        hl = {
          primary = 'String',
        },
      },
    },
  }
}
