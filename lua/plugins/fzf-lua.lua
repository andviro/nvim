local get_cwd = function()
  local cwd = vim.fn.systemlist('git rev-parse --show-toplevel')[1]
  if vim.v.shell_error ~= 0 then
    -- if not git then active lsp client root
    -- will get the configured root directory of the first attached lsp. You will have problems if you are using multiple lsps
    local clients = vim.lsp.get_clients()
    if clients then
      cwd = clients[1].config.root_dir
    else
      cwd = vim.fn.expand '%:p:h'
    end
  end
  return cwd
end

return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  opts = {
    -- 'borderless',
    'ivy',
    -- 'telescope',
    -- fzf_colors = true,
    files = {
      prompt = "Files> ",
      file_ignore_patterns = {
        '^node_modules/',
        '^.terraform/',
        '%.jpg',
        '%.png',
        '^vendor/',
        '^proto_vendor/',
        '^.env/',
        '^.venv/',
        '^.git/',
        'mock/',
        'fakes/',
      },
    }
  },
  keys = {
    {
      '<C-p>',
      function()
        require('fzf-lua').files { cwd = get_cwd() }
      end,
      desc = 'O[p]en file [p]icker',
    },
    {
      '<C-j>',
      function()
        require('fzf-lua').lsp_live_workspace_symbols()
      end,
      desc = 'O[p]en file [p]icker',
    },
    {
      '<C-h>',
      function()
        require('fzf-lua').oldfiles {}
      end,
      desc = 'Open [h]istory',
    },
    {
      '<Leader>a',
      function()
        require('fzf-lua').lsp_code_actions { silent = true }
        -- vim.lsp.buf.code_action()
      end,
      desc = 'Code [A]ctions',
    },
    {
      '<Leader><C-p>',
      function()
        require('fzf-lua').lsp_finder {}
      end,
      desc = 'LSP References',
    },
    {
      '<Leader><Space>',
      function()
        require('fzf-lua').lsp_implementations { silent = true }
      end,
      desc = 'LSP References',
    },
    { '<leader>gb', ':FzfLua git_branches<CR>', desc = 'Neogit [b]ranches' },
  },
}
