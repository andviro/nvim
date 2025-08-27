local o = vim.opt
local wo = vim.wo
local fn = vim.fn
local api = vim.api

vim.g.mapleader = ';'
vim.g.maplocalleader = ';'
vim.cmd 'set inccommand=split'
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

vim.opt.langmap = vim.fn.join({
  -- | `to` should be first     | `from` should be second
  escape(ru_shift)
  .. ';'
  .. escape(en_shift),
  escape(ru) .. ';' .. escape(en),
}, ',')
o.termsync = true
o.guicursor = 'n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50' -- block in normal and beam cursor in insert mode
o.updatetime = 300                                           -- faster completion
o.timeoutlen = 400                                           -- time to wait for a mapped sequence to complete (in milliseconds)
o.ttimeoutlen = 0                                            -- Time in milliseconds to wait for a key code sequence to complete
o.backup = true                                              -- creates a backup file
o.backupdir = { fn.stdpath 'data' .. '/backup' }
o.swapfile = false                                           -- enable/disable swap file creation
o.undofile = true                                            -- enable/disable undo file creation
o.backup = true
o.title = true
o.undodir = { fn.stdpath 'data' .. '/undo' }
o.history = 10000           -- Use the 'history' option to set the number of lines from command mode that are remembered.
o.clipboard = 'unnamedplus' -- allows neovim to access the system clipboard
o.spell = false
o.spelllang = { 'ru', 'en' }
o.keymap = 'russian-yawerty'
o.iminsert = 0
o.imsearch = -1
o.conceallevel = 0 -- so that `` is visible in markdown files
o.wrap = false
o.textwidth = 79
o.number = true
o.relativenumber = false
o.cmdheight = 1    -- space for displaying messages/commands
o.showtabline = 1  -- show tabs
o.laststatus = 3
o.showmode = false -- XXX
o.autoread = true
-- o.autochdir = true
o.autoindent = true
o.formatoptions = 'jcroql'
o.autowrite = true
o.hidden = true
-- o.sessionoptions:remove 'options'
o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
o.smartcase = true     -- smart case
o.ignorecase = true    -- ignore case
o.smartindent = true   -- make indenting smarter again
o.splitbelow = true    -- force all horizontal splits to go below current window
o.splitright = true    -- force all vertical splits to go to the right of current window
o.expandtab = true     -- convert tabs to spaces
o.smarttab = true      -- convert tabs to spaces
o.shiftwidth = 4       -- the number of spaces inserted for each indentation
o.tabstop = 4          -- how many columns a tab counts for
o.termguicolors = true -- set term gui colors (most terminals support this)
o.cursorline = false
o.scrolloff = 3        -- Minimal number of screen lines to keep above and below the cursor
o.sidescrolloff = 5    -- The minimal number of columns to scroll horizontally
o.hlsearch = false     -- highlight all matches on previous search pattern
o.incsearch = true
o.showmatch = true
o.matchtime = 2
o.infercase = true   -- ignore case in search patterns
o.foldenable = false -- disable folding; enable with zi
wo.foldcolumn = '1'
wo.foldcolumn = '1'
o.list = false
-- o.listchars = { eol = '¬', tab = '  ', trail = '~', extends = '>', precedes = '<' }
-- o.listchars = { eol = '¬', tab = '>·', trail = '~', extends = '>', precedes = '<' }
o.shortmess = o.shortmess + 'c' -- prevent "pattern not found" messages
wo.colorcolumn = '99999'
o.wildmode = 'list:longest,full'
o.wildmenu = true
o.lazyredraw = true -- do not redraw screen while running macros
o.grepprg = 'rg --hidden --vimgrep --smart-case --'
-- o.completeopt = { 'menuone', 'noselect', 'noinsert' } -- A comma separated list of options for Insert mode completion
o.completeopt = 'menu,menuone,noinsert,popup,fuzzy,preview'
o.wildignorecase = true -- When set case is ignored when completing file names and directories
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

-- vim.g.VM_maps = {}
-- vim.g.VM_maps['Select All'] = '<M-n>'
-- vim.g.VM_maps['Visual All'] = '<M-n>'
-- vim.g.VM_maps['Skip Region'] = '<C-x>'
-- vim.g.VM_maps['Increase'] = '+'
-- vim.g.VM_maps['Decrease'] = '-'
--
-- go to last loc when opening a buffer
api.nvim_create_autocmd('BufReadPost',
  { command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]] })

local highlight_group = api.nvim_create_augroup('YankHighlight', { clear = true })
api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
