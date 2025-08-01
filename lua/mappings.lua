local map = vim.keymap.set
local nore_options = { silent = true, remap = false }
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
map('n', '<leader>o', ':update<CR> :source<CR>')
map('n', '<leader>rn', vim.lsp.buf.rename)
map('n', '<Tab>', ':b#<CR>', { desc = 'alternate buffer' })
map({ 'c', 'i' }, '<C-\\>', '<C-^>', { desc = 'switch language', silent = true })
map({ 'c', 'i' }, '<C-/>', '<C-^>', { desc = 'switch language', silent = true })
map({ 'c', 'i' }, '<C-Space>', '<C-^>', { desc = 'switch language', silent = true })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
map('n', '<leader>q', vim.diagnostic.setqflist, { desc = 'Open diagnostics list' })
map({ 'n', 'v' }, '<Space>', '<C-f>', nore_options)
map('n', 'H', '<C-o>', nore_options)
map('n', 'L', '<C-i>', nore_options)
map('v', 'K', 'gc', { remap = true })
-- mitigate insert-mode hell
map('i', '<C-u>', '<c-g>u<c-u>', nore_options)
map('i', '<C-w>', '<c-g>u<c-w>', nore_options)
-- multi-cursor substitution
-- map('n', '<C-n>', '*Ncgn', nore_options)
-- emacs-like insert mode
map({ 'c', 'i' }, '<C-A>', '<Home>', nore_options)
map({ 'c' }, '<C-B>', '<Left>', nore_options)
map({ 'c' }, '<C-D>', '<Del>', nore_options)
map({ 'c' }, '<C-E>', '<End>', nore_options)
map({ 'c', 'i' }, '<C-F>', '<Right>', nore_options)
map({ 'c' }, '<C-N>', '<Down>', nore_options)
map({ 'c' }, '<C-P>', '<Up>', nore_options)
map({ 'c' }, '<Esc><C-B>', '<S-Left>', nore_options)
map({ 'c' }, '<Esc><C-F>', '<S-Right>', nore_options)
map('n', '<CR>', vim.lsp.buf.definition)
-- windows to close with "q"
vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'help', 'query', 'startuptime', 'qf', 'lspinfo', 'markdown', 'git', 'aerial', 'fugitive*', 'flog*', 'null-ls-info', 'doc/*.md' },
	callback = function(args)
		local buftype = vim.opt_local.buftype:get()
		if args.match == 'markdown' and buftype ~= 'help' then
			return
		end
		vim.fn.execute [[nnoremap <buffer><silent> q :close<CR>|nnoremap <buffer> <CR> <CR>]]
	end,
})
vim.api.nvim_create_autocmd('FileType', { pattern = 'man', command = [[nnoremap <buffer><silent> q :quit<CR>]] })
