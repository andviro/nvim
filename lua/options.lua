local o = vim.o
local g = vim.g
local fn = vim.fn
local api = vim.api
o.number = true
o.hls = false
o.relativenumber = false
o.signcolumn = "yes"
o.termguicolors = true
o.wrap = false
o.tabstop = 4
o.shiftwidth = 4
o.smarttab = true -- convert tabs to spaces
o.swapfile = false
g.mapleader = ";"
o.winborder = "double"
o.clipboard = "unnamedplus"
o.inccommand = "split"
o.history = 10000           -- Use the 'history' option to set the number of lines from command mode that are remembered.
o.clipboard = 'unnamedplus' -- allows neovim to access the system clipboard
o.spell = false
o.keymap = 'russian-yawerty'
o.iminsert = 0
o.imsearch = -1
o.conceallevel = 0 -- so that `` is visible in markdown files
-- o.autochdir = true
o.autowrite = true
o.hidden = true
o.undofile = true
o.undodir = fn.stdpath 'data' .. '/undo'
o.smartcase = true   -- smart case
o.ignorecase = true  -- ignore case
o.smartindent = true -- make indenting smarter again
o.splitbelow = true  -- force all horizontal splits to go below current window
o.splitright = true  -- force all vertical splits to go to the right of current window
o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
o.background = 'dark'
-- o.completeopt = 'menu,menuone,noinsert'
o.completeopt = 'menu,menuone,noinsert,popup,fuzzy,preview'
o.scrolloff = 3         -- Minimal number of screen lines to keep above and below the cursor
o.sidescrolloff = 5     -- The minimal number of columns to scroll horizontally
o.wildignorecase = true -- When set case is ignored when completing file names and directories
o.lazyredraw = true     -- do not redraw screen while running macros
o.wildignore = [[
.git,.hg,.svn
*.aux,*.out,*.toc
*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
*.mp3,*.oga,*.ogg,*.wav,*.flac
*.eot,*.otf,*.ttf,*.woff
*.doc,*.pdf,*.cbr,*.cbz
*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
*.swp,.lock,.DS_Store,._*
*/tmp/*,*.so,*.swp,*.zip,**/node_modules/**,**/target/**,**.terraform/**"
]]
vim.opt.exrc = true
vim.opt.secure = true
vim.opt.switchbuf = 'usetab'

vim.cmd 'filetype on'
vim.filetype.add {
	pattern = {
		['.*/templates/.*%.yaml'] = 'helm',
	},
}
local function escape(str)
	-- You need to escape these characters to work correctly
	local escape_chars = [[;,."|\]]
	return vim.fn.escape(str, escape_chars)
end

-- Recommended to use lua template string
local en = [[`qwertyuiop[]\asdfghjklzxcvbnm=]]
local ru = [[юявертыуиопшщэасдфгхйклзьцжбнмч]]
local en_shift = [[~QWERTYUIOP{}|ASDFGHJKLZXCVBNM+]]
local ru_shift = [[ЮЯВЕРТЫУИОПШЩЭАСДФГХЙКЛЗЬЦЖБНМЧ]]

o.langmap = vim.fn.join({
	escape(ru_shift) .. ';' .. escape(en_shift),
	escape(ru) .. ';' .. escape(en),
}, ',')
o.termsync = true

--- Remove all trailing whitespace on save
local TrimWhiteSpaceGrp = api.nvim_create_augroup('TrimWhiteSpaceGrp', { clear = true })
api.nvim_create_autocmd('BufWritePre', {
	command = [[:%s/\s\+$//e]],
	group = TrimWhiteSpaceGrp,
})

-- disable list option in certain filetypes
api.nvim_create_autocmd('FileType', { pattern = { 'NeoGitStatus' }, command = [[setlocal list!]] })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = api.nvim_create_augroup('YankHighlight', { clear = true })
api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = '*',
})

-- go to last loc when opening a buffer
api.nvim_create_autocmd('BufReadPost',
	{ command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]] })
