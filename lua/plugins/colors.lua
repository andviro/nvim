return {
	-- 'fenetikm/falcon',
	-- { 'psliwka/termcolors.nvim',  opts = {} },
	{
		'AlexvZyl/nordic.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			-- require('nordic').load()
		end
	},
	{
		"tiagovla/tokyodark.nvim",
		opts = {
			-- custom options here
		},
		config = function(_, opts)
			-- require("tokyodark").setup(opts) -- calling setup is optional
			-- vim.cmd [[colorscheme tokyodark]]
		end,
	},
	{
		'loganswartz/sunburn.nvim',
		dependencies = { 'loganswartz/polychrome.nvim' },
		-- you could do this, or use the standard vimscript `colorscheme sunburn`
		config = function()
			-- vim.cmd.colorscheme 'sunburn'
		end,
	},
	{
		'everviolet/nvim',
		name = 'evergarden',
		priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
		opts = {
			theme = {
				variant = 'fall', -- 'winter'|'fall'|'spring'|'summer'
				accent = 'green',
			},
			-- editor = {
			-- 	transparent_background = false,
			-- 	sign = { color = 'none' },
			-- 	float = {
			-- 		color = 'mantle',
			-- 		solid_border = false,
			-- 	},
			-- 	completion = {
			-- 		color = 'surface0',
			-- 	},
			-- },
		}
	},
	{
		"slugbyte/lackluster.nvim",
		lazy = false,
		priority = 1000,
		init = function()
			-- vim.cmd.colorscheme("lackluster")
			-- vim.cmd.colorscheme("lackluster-hack") -- my favorite
			-- vim.cmd.colorscheme("lackluster-mint")
		end,
	},
	-- {
	-- 	"samharju/serene.nvim",
	-- 	-- for using as main:
	-- 	config = function()
	-- 		-- vim.cmd.colorscheme("serene")
	-- 	end,
	-- },
	{
		"killitar/obscure.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme("obscure")
		end,
	},
	-- Lazy
	{
		"olimorris/onedarkpro.nvim",
		priority = 1000, -- Ensure it loads first
		config = function()
			-- vim.cmd("colorscheme onedark")
		end,
	},
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		-- Optional; default configuration will be used if setup isn't called.
		config = function()
			require("everforest").setup({
				background = "hard",
			})
			-- vim.cmd 'colorscheme everforest'
		end,
	},
	{
		"binbandit/achroma.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme "achroma"
		end,
	},
	{ "adisen99/apprentice.nvim", dependencies = { "rktjmp/lush.nvim" } },
	-- -- {
	-- -- 	'kdheepak/monochrome.nvim',
	-- -- 	config = function()
	-- -- 		-- vim.cmd 'colorscheme monochrome'
	-- -- 	end
	-- -- },
	-- {
	-- 	"kyazdani42/blue-moon",
	-- 	config = function()
	-- 		vim.opt.termguicolors = true
	-- 		-- vim.cmd "colorscheme blue-moon"
	-- 	end
	-- },
	-- { 'keiyakeiya/PapilioDehaanii.vim', },
	-- {
	-- 	"sainnhe/sonokai",
	-- 	-- config = function()
	-- 	-- 	vim.cmd 'colorscheme sonokai'
	-- 	-- end,
	-- },
	{ "savq/melange-nvim" },
	{
		"https://gitlab.com/HiPhish/resolarized.nvim",
		config = function()
			local resolarized  = require 'resolarized'
			local palette      = resolarized.palette.solarized.dark
			local scheme       = resolarized.scheme.solarized
			palette.base03.gui = 0x001e27
			resolarized.apply('solarized-dark', palette, scheme)
			vim.cmd 'colorscheme solarized-dark'
			-- vim.cmd 'colorscheme selenized-black'
		end,
	},
	-- {
	-- 	"phha/zenburn.nvim",
	-- 	config = function() require("zenburn").setup() end,
	-- },
	{
		"vague2k/vague.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other plugins
		config = function()
			-- NOTE: you do not need to call setup if you don't want to.
			require("vague").setup({
				boolean = "none",
				error = "none",
				headings = "none",
				-- optional configuration here
			})
			-- vim.cmd("colorscheme vague")
		end
	},
	{
		'mcchrish/zenbones.nvim',
		-- Optionally install Lush. Allows for more configuration or extending the colorscheme
		-- If you don't want to install lush, make sure to set g:zenbones_compat = 1
		-- In Vim, compat mode is turned on as Lush only works in Neovim.
		dependencies = {
			'rktjmp/lush.nvim',
		},
		config = function()
			vim.g.zenbones = { darkness = 'default' }
			-- vim.cmd 'colorscheme rosebones'
			-- vim.cmd 'colorscheme zenbones'
			-- vim.cmd 'colorscheme zenwritten'
		end,
	},
	{
		'dgox16/oldworld.nvim',
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			-- vim.cmd 'colorscheme oldworld'
		end,
	},
	-- {
	-- 	'pappasam/papercolor-theme-slim',
	-- 	config = function()
	-- 		-- vim.cmd 'colorscheme PaperColorSlim'
	-- 	end,
	-- },
	{
		'ramojus/mellifluous.nvim',
		-- version = "v0.*", -- uncomment for stable config (some features might be missed if/when v1 comes out)
		config = function()
			require('mellifluous').setup {
				colorset = 'kanagawa_dragon',
			} -- optional, see configuration section.
			-- vim.cmd 'colorscheme mellifluous'
		end,
	},
	{ 'kepano/flexoki-neovim', name = 'flexoki' },
	-- {
	-- 	'0xstepit/flow.nvim',
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {},
	-- 	config = function()
	-- 		require('flow').setup {
	-- 			dark_theme = true, -- Set the theme with dark background.
	-- 			high_contrast = false, -- Make the dark background darker or the light background lighter.
	-- 			transparent = false, -- Set transparent background.
	-- 			fluo_color = 'pink', -- Color used as fluo. Available values are pink, yellow, orange, or green.
	-- 			mode = 'desaturate', -- Mode of the colors. Available values are: dark, bright, desaturate, or base.
	-- 			aggressive_spell = false, -- Use colors for spell check.
	-- 		}
	-- 		-- vim.cmd 'colorscheme flow'
	-- 	end,
	-- },
	{
		'sho-87/kanagawa-paper.nvim',
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			-- vim.cmd 'colorscheme kanagawa-paper'
		end,
	},
	-- {
	-- 	"sainnhe/gruvbox-material",
	-- 	config = function()
	-- 		-- vim.cmd 'colorscheme gruvbox-material'
	-- 	end,
	-- },
	-- {
	-- 	"calind/selenized.nvim",
	-- 	config = function()
	-- 		-- vim.cmd 'colorscheme selenized'
	-- 	end,
	-- },
	-- {
	-- 	'craftzdog/solarized-osaka.nvim',
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require('solarized-osaka').setup {
	-- 			style = 'storm',
	-- 			transparent = false,
	-- 			styles = {
	-- 				floats = 'transparent',
	-- 				sidebars = 'transparent',
	-- 			},
	-- 			on_colors = function(colors)
	-- 				colors.bg = '#001a1d'
	-- 			end,
	-- 		}
	-- 		-- vim.cmd 'colorscheme solarized-osaka'
	-- 		-- vim.cmd 'hi link LspInlayHint LineNr'
	-- 		-- vim.cmd 'hi WinBar ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE cterm=bold gui=bold'
	-- 		-- vim.cmd 'hi WinBarNC ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE cterm=bold gui=bold'
	-- 	end,
	-- },
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
	-- {
	-- 	'ishan9299/nvim-solarized-lua',
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.g.solarized_visibility = 'low'
	-- 		vim.cmd 'colorscheme solarized'
	-- 		vim.cmd 'hi link LspInlayHint LineNr'
	-- 		vim.cmd 'hi WinBar ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE cterm=bold gui=bold'
	-- 		vim.cmd 'hi WinBarNC ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE cterm=bold gui=bold'
	-- 	end,
	-- },
	-- Or with configuration
	-- {
	-- 	'projekt0n/github-nvim-theme',
	-- 	name = 'github-theme',
	-- 	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	-- 	priority = 1000, -- make sure to load this before all the other start plugins
	-- 	config = function()
	-- 		require('github-theme').setup({
	-- 			-- ...
	-- 		})
	--
	-- 		vim.cmd('colorscheme github_dark_default')
	-- 	end,
	-- }
}
