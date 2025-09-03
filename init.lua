-- Install Lazy.
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system {
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable',
		lazypath,
	}
end
vim.opt.rtp = vim.opt.rtp ^ lazypath

require('options')
require('mappings')

require('lazy').setup({ { import = 'plugins' } }, {
	install = {
		colorscheme = { 'retrobox' },
	},
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
	performance = {
		rtp = {
			-- Stuff I don't use.
			disabled_plugins = {
				-- 'gzip',
				-- 'netrwPlugin',
				-- 'rplugin',
				-- 'tarPlugin',
				-- 'tohtml',
				-- 'tutor',
				-- 'zipPlugin',
			},
		},
	},
})
