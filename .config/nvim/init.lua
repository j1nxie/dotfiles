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
		end,

		function()
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
		end
	}, 
	{
		"m-demare/hlargs.nvim",
		requires = "nvim-treesitter/nvim-treesitter",
		function()
			require("hlargs").setup()
		end
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
	{
		"echasnovski/mini.nvim",
		function()
			local map = require("mini.map")
			map.setup({
				window = {
					show_integration_count = false,
				},
				integrations = {
					map.gen_integration.builtin_search(),
					map.gen_integration.gitsigns(),
					map.gen_integration.diagnostic(),
				}
			})
		end
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		requires = "nvim-lua/plenary.nvim",
		function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.code_actions.eslint_d,
					null_ls.builtins.code_actions.gitrebase,
					null_ls.builtins.code_actions.gitsigns,
					null_ls.builtins.diagnostics.eslint_d,
					null_ls.builtins.diagnostics.stylelint,
					null_ls.builtins.formatting.prettierd,
				},
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({
							group = augroup,
							buffer = bufnr,
						})
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ bufnr = bufnr })
							end,
						})
					end
				end,
			})
		end
	},
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",

		function()
			require("telescope").setup()
		end
	},
	{
		"pwntester/octo.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("octo").setup()
		end
	},
	"ludovicchabant/vim-gutentags"
}

vim.g.mapleader = " "
vim.cmd [[
	filetype plugin indent on
	syntax enable
	colorscheme kanagawa
	autocmd BufWritePre * lua vim.lsp.buf.format({ bufnr = bufnr })
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

key.set("n", "<Leader>mc", MiniMap.close)
key.set("n", "<Leader>mf", MiniMap.toggle_focus)
key.set("n", "<Leader>mo", MiniMap.open)
key.set("n", "<Leader>mr", MiniMap.refresh)
key.set("n", "<Leader>ms", MiniMap.toggle_side)
key.set("n", "<Leader>mt", MiniMap.toggle)

local builtin = require("telescope.builtin")
key.set("n", "<Leader>ff", builtin.find_files, {})
key.set("n", "<Leader>fg", builtin.live_grep, {})
key.set("n", "<Leader>fb", builtin.buffers, {})
key.set("n", "<Leader>fh", builtin.help_tags, {})

local g = vim.g
g.coq_settings = { ["keymap.jump_to_mark"] = "<C-N>", ["keymap.bigger_preview"] = "<C-B>" }

local lsp = require("lspconfig")
local coq = require("coq")
local rt = require("rust-tools")

rt.setup({
	server = {
		coq.lsp_ensure_capabilities({
			settings = {
				["rust-analyzer"] = {
					["checkOnSave.command"] = "clippy"
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
