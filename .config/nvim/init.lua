require "bootstrap"
require "dep" {
	{
		"nvim-lualine/lualine.nvim",
		function()
			require("lualine").setup()
			require("lualine").hide({
				place = { "tabline" },
				unhide = false
			})
		end
	},
	{
		"rebelot/kanagawa.nvim",
		function()
			require("kanagawa").setup({
				commentStyle = { italic = false },
			})
		end
	},
	{
		"nvchad/nvim-colorizer.lua",
		function()
			require("colorizer").setup()
		end
	},
	{
		"yamatsum/nvim-cursorline",
		function()
			require("nvim-cursorline").setup()
		end
	},
	{
		"noib3/nvim-cokeline",
		requires = "nvim-tree/nvim-web-devicons",
		function()
			require("cokeline").setup()
		end
	},
	{
		"ms-jpq/coq_nvim",
		branch = "coq",
		requires = "ms-jpq/coq.artifacts",
		config = function()
			vim.cmd("COQdeps")
		end
	},
	"neovim/nvim-lspconfig",
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
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			vim.cmd("TSUpdate")
		end
	}, 
	{
		"m-demare/hlargs.nvim",
		requires = "nvim-treesitter/nvim-treesitter",
	},
	{
		"mrjones2014/nvim-ts-rainbow",
		requires = "nvim-treesitter/nvim-treesitter",
	},
	{
		"lewis6991/gitsigns.nvim",
		function()
			require("gitsigns").setup({
				yadm = {
					enable = true
				}
			})
		end
	},
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
	"ludovicchabant/vim-gutentags"
}

vim.g.mapleader = " "
vim.cmd [[
	filetype plugin indent on
	syntax enable
	colorscheme kanagawa
]]

local set = vim.opt
set.termguicolors = true
set.guifont = "FiraCode Nerd Font Mono:style=Bold,Regular:h12"
set.clipboard = "unnamed,unnamedplus"
set.fileformats = "unix,dos"
set.fileformat = unix

set.number = true
set.relativenumber = true

set.splitright = true
set.splitbelow = true

set.hidden = true
set.backup = false
set.writebackup = false

set.cmdheight = 1
set.showmode = false
set.updatetime = 300
set.shortmess = "filnxtToOFAc"
set.signcolumn = "yes"
set.showtabline = 2
set.scrolloff = 2
set.autoindent = true
set.wrap = false
set.joinspaces = false
set.showtabline = 1

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

key.set("n", "<left>", ":bp<CR>")
key.set("n", "<right>", ":bn<CR>")

key.set("n", "j", "gj")
key.set("n", "k", "gk")

key.set("n", "<leader>gg", ":LazyGit<CR>", { silent = true })

key.set("", "H", "^")
key.set("", "L", "$")

key.set("n", "<F5>", ":Neotree<CR>")


g.coq_settings = { ["keymap.jump_to_mark"] = "<C-N>", ["keymap.bigger_preview"] = "<C-B>" }


local lsp = require("lspconfig")
local coq = require("coq")
local rt = require("rust-tools")

rt.setup({
	server = {
		coq.lsp_ensure_capabilities({
			settings = {
				["rust-analyzer"] = {
					["checkOnSave.command"] = "cippy"
				}
			}
		})
	}
})

lsp.clangd.setup(
	coq.lsp_ensure_capabilities()
)

lsp.eslint.setup(
	coq.lsp_ensure_capabilities()
)

lsp.pyright.setup(
	coq.lsp_ensure_capabilities()
)

require("nvim-treesitter.configs").setup({
	ensure_installed = { "c", "lua", "vim", "help" },
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
	}
})

require("hlargs").setup()
