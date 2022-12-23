require "bootstrap"
require "dep" {
	-- UI enhancements
	-- lualine
	{
		"nvim-lualine/lualine.nvim",
		function()
			require("lualine").setup()
		end
	},
	-- nightfox colorscheme
	"EdenEast/nightfox.nvim",
	-- colorizer for color previews
	{
		"nvchad/nvim-colorizer.lua"
		function()
			require("colorizer").setup()
		end
	},
	-- cursorline
	{
		"yamatsum/nvim-cursorline",
		function()
			require("nvim-cursorline").setup()
		end
	},

	-- Language support
	-- ale
	"dense-analysis/ale",
	-- coq for completion
	{
		"ms-jpq/coq_nvim",
		branch = "coq",
		requires = "ms-jpq/coq.artifacts",
		config = function()
			vim.cmd("COQdeps")
		end
	},
	-- lspconfig
	"neovim/nvim-lspconfig",
	-- rust-tools
	"simrat39/rust-tools.nvim",
	{
		"saecki/crates.nvim",
		requires = "nvim-lua/plenary.nvim",
		function()
			require("crates").setup {
				src = {
					coq = {
						enabled = true,
						name = "crates.nvim"
					}
				}
			}
		end
	},
	-- misc languages
	"sheerun/vim-polyglot",

	-- Git plugins
	-- gitsigns
	{
		"lewis6991/gitsigns.nvim",
		function()
			require("gitsigns").setup()
		end
	},
	-- lazygit
	"kdheepak/lazygit.nvim",
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
			"nvim-lua/plenary.nvim"
		}
	},
	"wfxr/minimap.vim"
}

vim.g.mapleader = " "
vim.cmd [[
	filetype plugin indent on
	syntax enable
	colorscheme carbon fox
]]

local set = vim.opt
set.termguicolors = true
set.guifont = "FiraCode NF:style=Regular:h12"
set.clipboard = "unnamed, unnamedplus"
set.fileformats = "unix, dos"
set.fileformat = unix

set.number = true
set.relativenumber = true

set.splitright = true
set.splitbelow = true

set.hidden = true
set.nobackup = true
set.nowritebackup = true

set.cmdheight = 1
set.noshowmode = true
set.updatetime = 300
set.shortmess = "filnxtToOFAc"
set.signcolumn = "yes"
set.scrolloff = 2
set.autoindent = true
set.nowrap = true
set.nojoinspaces = true

set.shiftwidth = 4
set.tabstop = 4
set.softtabstop = 4

local key = vim.keymap
key.set("n", "<C-J>", "<C-W><C-J>")
key.set("n", "<C-K>", "<C-W><C-K>")
key.set("n", "<C-L>", "<C-W><C-L>")
key.set("n", "<C-H>", "<C-W><C-H>")

key.set("n", "<up>", "<nop>")
key.set("n", "<down>", "<nop>")
key.set("i", "<up>", "<nop>")
key.set("i", "<down>", "<nop>")
key.set("i", "<left>", "<nop>")
key.set("i", "<right>", "<nop>")
