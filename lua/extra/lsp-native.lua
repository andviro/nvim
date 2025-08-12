local lsp_configs = {
  buf_ls = {},
  -- golangci_lint_ls = {
  --   golangci_lint_ls = {
  --     filetypes = { 'go', 'gomod' },
  --   },
  -- },
  gopls = {
    gopls = {
      gofumpt = true,
      codelenses = {
        gc_details = false,
        generate = true,
        regenerate_cgo = true,
        run_govulncheck = true,
        test = true,
        tidy = true,
        upgrade_dependency = true,
        vendor = true,
      },
      hints = {
        -- assignVariableTypes = true,
        -- compositeLiteralFields = true,
        -- compositeLiteralTypes = true,
        constantValues = true,
        -- functionTypeParameters = true,
        -- parameterNames = true,
        -- rangeVariableTypes = true,
      },
      analyses = {
        -- fieldalignment = true,
        nilness = true,
        unusedparams = true,
        unusedwrite = true,
        useany = true,
      },
      usePlaceholders = true,
      completeUnimported = true,
      staticcheck = true,
      directoryFilters = { '-.git', '-.vscode', '-.idea', '-.vscode-test', '-node_modules' },
      semanticTokens = true,
      buildFlags = { '-tags=wireinject' },
    },
  },
  helm_ls = {
    yamlls = {
      path = 'yaml-language-server',
    },
  },
  -- pyright = {},
  pylsp = {
    settings = {
      pylsp = {
        plugins = {
          pyflakes = { enabled = false },
          pycodestyle = { enabled = false },
          autopep8 = { enabled = false },
          yapf = { enabled = false },
          mccabe = { enabled = false },
          pylsp_mypy = { enabled = false },
          pylsp_black = { enabled = false },
          pylsp_isort = { enabled = false },
        },
      },
    },
  },
  rust_analyzer = {},
  -- ts_ls = {},
  html = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      -- diagnostics = {
      -- 	-- Get the language server to recognize the `vim` global
      -- 	globals = { "vim" },
      -- },
    },
  },
  taplo = {
    schemaStore = {
      enable = true,
      url = 'https://www.schemastore.org/api/json/catalog.json',
    },
    schemas = {
      ['https://raw.githubusercontent.com/distinction-dev/alacritty-schema/main/alacritty/reference.json'] =
      '*alacritty.{yml,yaml}',
    },
  },
  dockerls = {},
  marksman = {},
  jsonls = {
    cmd = { 'vscode-json-language-server', '--stdio' },
    format = { enabled = false },
    schemas = {
      {
        description = 'ESLint config',
        fileMatch = { '.eslintrc.json', '.eslintrc' },
        url = 'http://json.schemastore.org/eslintrc',
      },
      {
        description = 'Package config',
        fileMatch = { 'package.json' },
        url = 'https://json.schemastore.org/package',
      },
      {
        description = 'Packer config',
        fileMatch = { 'packer.json' },
        url = 'https://json.schemastore.org/packer',
      },
      {
        description = 'Renovate config',
        fileMatch = {
          'renovate.json',
          'renovate.json5',
          '.github/renovate.json',
          '.github/renovate.json5',
          '.renovaterc',
          '.renovaterc.json',
        },
        url = 'https://docs.renovatebot.com/renovate-schema',
      },
      {
        description = 'OpenApi config',
        fileMatch = { '*api*.json' },
        url = 'https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json',
      },
    },
  },
  yamlls = {
    yaml = {
      keyOrdering = false,
    },
    schemaStore = {
      enable = true,
      url = 'https://www.schemastore.org/api/json/catalog.json',
    },
    schemas = {
      kubernetes = '*.yaml',
      ['http://json.schemastore.org/github-workflow'] = '.github/workflows/*',
      ['http://json.schemastore.org/github-action'] = '.github/action.{yml,yaml}',
      ['http://json.schemastore.org/ansible-stable-2.9'] = 'roles/tasks/*.{yml,yaml}',
      ['http://json.schemastore.org/prettierrc'] = '.prettierrc.{yml,yaml}',
      ['http://json.schemastore.org/kustomization'] = 'kustomization.{yml,yaml}',
      ['http://json.schemastore.org/ansible-playbook'] = '*play*.{yml,yaml}',
      ['http://json.schemastore.org/chart'] = 'Chart.{yml,yaml}',
      ['https://json.schemastore.org/dependabot-v2'] = '.github/dependabot.{yml,yaml}',
      ['https://json.schemastore.org/gitlab-ci'] = '*gitlab-ci*.{yml,yaml}',
      ['https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json'] =
      '*api*.{yml,yaml}',
      ['https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json'] =
      '*docker-compose*.{yml,yaml}',
      ['https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json'] =
      '*flow*.{yml,yaml}',
      ['https://raw.githubusercontent.com/distinction-dev/alacritty-schema/main/alacritty/reference.json'] =
      '*alacritty.{yml,yaml}',
    },
    format = { enabled = false },
    validate = false, -- TODO: conflicts between Kubernetes resources and kustomization.yaml
    completion = true,
    hover = true,
  },
}
---Utility for keymap creation.
---@param lhs string
---@param rhs string|function
---@param opts string|table
---@param mode? string|string[]
local function keymap(lhs, rhs, opts, mode)
  opts = type(opts) == 'string' and { desc = opts }
      or vim.tbl_extend('error', opts --[[@as table]], { buffer = bufnr })
  mode = mode or 'n'
  vim.keymap.set(mode, lhs, rhs, opts)
end

---For replacing certain <C-x>... keymaps.
---@param keys string
local function feedkeys(keys)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys, true, false, true), 'n', true)
end

---Is the completion menu open?
local function pumvisible()
  return tonumber(vim.fn.pumvisible()) ~= 0
end
return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'windwp/nvim-autopairs',
    { 'j-hui/fidget.nvim',    opts = {}, tag = 'legacy' },
    { "mason-org/mason.nvim", opts = {} },
    {
      'nvimtools/none-ls.nvim', -- none-ls is an active community fork of null-ls
      opts = function(_, opts)
        local nls = require('null-ls')
        opts.sources = vim.list_extend(opts.sources or {}, {
          nls.builtins.code_actions.gomodifytags,
          nls.builtins.code_actions.impl,
          nls.builtins.formatting.goimports,
          nls.builtins.completion.nvim_snippets,
        })
        return opts
      end,
    },
  },
  config = function()
    for _, lsp in ipairs(vim.tbl_keys(lsp_configs)) do
      vim.lsp.config(lsp, { settings = lsp_configs[lsp] })
    end
    vim.lsp.enable(vim.tbl_keys(lsp_configs))
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('my/lsp', {}),
      callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if client:supports_method('textDocument/implementation') then
          -- Create a keymap for vim.lsp.buf.implementation ...
        end
        if client:supports_method('textDocument/completion') then
          local chars = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S",
            "T", "U", "V", "W", "X", "Y", "Z",
            "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",
            "w", "x",
            "y", "z" }
          for _, v in ipairs(vim.lsp.get_clients()[1].server_capabilities.completionProvider.triggerCharacters) do
            table.insert(chars, v)
          end
          client.server_capabilities.completionProvider.triggerCharacters = chars
          vim.lsp.completion.enable(true, client.id, args.buf, {
            autotrigger = true,
          })
          -- Use enter to accept completions.
          keymap('<CR>', function()
            return pumvisible() and '<C-y>' or '<cr>'
          end, {}, { 'i' })
          keymap('<Tab>', function()
            if pumvisible() then
              feedkeys '<C-n>'
            elseif vim.snippet.active { direction = 1 } then
              vim.snippet.jump(1)
            else
              feedkeys '<Tab>'
            end
          end, {}, { 'i', 's' })
          keymap('<S-Tab>', function()
            if pumvisible() then
              feedkeys '<C-p>'
            elseif vim.snippet.active { direction = -1 } then
              vim.snippet.jump(-1)
            else
              feedkeys '<S-Tab>'
            end
          end, {}, { 'i', 's' })
          keymap('<C-l>', function()
            if vim.snippet.active { direction = 1 } then
              vim.snippet.jump(1)
            elseif pumvisible() then
              feedkeys '<C-y>'
            else
              feedkeys '<C-l>'
            end
          end, {}, { 'i', 's' })
          keymap('<C-h>', function()
            if vim.snippet.active { direction = -1 } then
              vim.snippet.jump(-1)
            else
              feedkeys '<C-h>'
            end
          end, {}, { 'i', 's' })
          keymap('<C-j>', function()
            if pumvisible() then
              feedkeys '<C-n>'
            else
              if next(vim.lsp.get_clients { bufnr = 0 }) then
                vim.lsp.completion.trigger()
              else
                if vim.bo.omnifunc == '' then
                  feedkeys '<C-x><C-n>'
                else
                  feedkeys '<C-x><C-o>'
                end
              end
            end
          end, 'Trigger/select next completion', 'i')
          keymap('<C-k>', function()
            if pumvisible() then
              feedkeys '<C-p>'
            else
              feedkeys '<C-x><C-p>'
            end
          end, 'Select prev completion', 'i')
        end
        -- Auto-format ("lint") on save.
        -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
        if not client:supports_method('textDocument/willSaveWaitUntil')
            and client:supports_method('textDocument/formatting') then
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
            buffer = args.buf,
            callback = function()
              vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
            end,
          })
        end
      end,
    })
  end
}
