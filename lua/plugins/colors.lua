return {
	--
	-- 	"https://github.com/lifepillar/vim-solarized8",
	-- 	branch = 'neovim',
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd 'colorscheme solarized8'
	-- 		-- vim.cmd 'hi link LspInlayHint LineNr'
	-- 		vim.cmd 'hi WinBar ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE cterm=bold gui=bold'
	-- 		vim.cmd 'hi WinBarNC ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE cterm=bold gui=bold'
	-- 		vim.cmd 'hi link FloatBorder ToolbarLine'
	-- 	end
	-- }
	{
		'ishan9299/nvim-solarized-lua',
		priority = 1000,
		config = function()
			-- vim.g.solarized_visibility = 'normal'
			vim.g.solarized_visibility = 'low'
			vim.cmd 'colorscheme solarized'
			vim.cmd 'hi link LspInlayHint LineNr'
			vim.cmd 'hi WinBar ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE cterm=bold gui=bold'
			vim.cmd 'hi WinBarNC ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE cterm=bold gui=bold'
		end,
	},
}
