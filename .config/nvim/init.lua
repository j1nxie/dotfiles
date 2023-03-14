require "bootstrap"
require "dep" {
	{
		"nvim-lualine/lualine.nvim",
		function()
			require("lualine").setup({
				options = {
					theme = "auto",
					globalstatus = true,
					section_separators = { left = "", right = "" },
				},
				extensions = { "neo-tree" },
			})
			require("lualine").hide({
				place = { "tabline" },
				unhide = false
			})
		end
	},
	{
		"petertriho/nvim-scrollbar",
		function()
			require("scrollbar").setup()
		end
	},
	{
		"rebelot/kanagawa.nvim",
		function()
			require("kanagawa").setup({
				commentStyle = { italic = false },
				theme = "dragon",
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
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		requires = {
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"petertriho/cmp-git",
			"lukas-reineke/cmp-under-comparator",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"simrat39/rust-tools.nvim",
		},
		function()
			local lsp = require("lsp-zero").preset({
				name = "minimal",
				set_lsp_keymaps = true,
				manage_nvim_cmp = true,
				configure_diagnostics = true,
				suggest_lsp_servers = false,
				sign_icons = {
					error = "✘",
					warn = "▲",
					hint = "⚑",
					info = "",
				},
			})
			local cmp = require("cmp")
			lsp.nvim_workspace()
			lsp.skip_server_setup("rust-analyzer")
			lsp.setup_nvim_cmp({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
				}),
				sorting = {
					comparators = {
						cmp.config.compare.offset,
						cmp.config.compare.exact,
						cmp.config.compare.score,
						require("cmp-under-comparator").under,
						cmp.config.compare.kind,
						cmp.config.compare.sort_text,
						cmp.config.compare.length,
						cmp.config.compare.order,
					},
				}
			})

			cmp.setup.filetype("gitcommit", {
				sources = cmp.config.sources({
					{ name = "cmp_git" },
				}, {
					{ name = "buffer" },
				})
			})

			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "buffer" },
				})
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				})
			})
			lsp.on_attach(function(client, bufnr)
				local function buf_set_option(...)
					vim.api.nvim_buf_set_option(bufnr, ...)
				end
				local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end

				if (client.name == "eslint") then
					vim.api.nvim_command("autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll")
				end
			end)
			lsp.configure("stylelint-lsp", {
				settings = {
					autoFixOnFormat = true,
					autoFixOnSave = true,
				}
			})
			lsp.setup()

			local rust_lsp = lsp.build_options("rust-analyzer", {
				single_file_support = false,
				check = {
					command = "clippy",
				}
			})

			require("rust-tools").setup({ server = rust_lsp })
		end
	},
	"neovim/nvim-lspconfig",
	"simrat39/rust-tools.nvim",
	{
		"saecki/crates.nvim",
		requires = "nvim-lua/plenary.nvim",
		function()
			require("crates").setup()
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
		"HiPhish/nvim-ts-rainbow2",
		requires = "nvim-treesitter/nvim-treesitter",
	},
	{
		"lewis6991/gitsigns.nvim",
		requires = "petertriho/nvim-scrollbar",
		function()
			require("gitsigns").setup({
				yadm = {
					enable = true
				}
			})
			require("scrollbar.handlers.gitsigns").setup()
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
		function()
			require("octo").setup()
		end
	},
	{
		"kevinhwang91/nvim-hlslens",
		requires = "petertriho/nvim-scrollbar",
		function()
			require("hlslens").setup()
			require("scrollbar.handlers.search").setup()
		end
	},
	"wakatime/vim-wakatime",
	{
		"lukas-reineke/indent-blankline.nvim",
		function()
			vim.opt.list = true
			vim.opt.listchars:append "space:·"
			require("indent_blankline").setup({
				space_char_blankline = " ",
				show_current_context = true,
				char_highlight_list = {
					"TSRainbowRed",
					"TSRainbowYellow",
					"TSRainbowBlue",
					"TSRainbowOrange",
					"TSRainbowGreen",
					"TSRainbowViolet",
					"TSRainbowCyan",
				}
			})
		end
	},
	"ludovicchabant/vim-gutentags"
}

vim.g.mapleader = " "
vim.o.background = ""
vim.cmd [[
	filetype plugin indent on
	syntax enable
	colorscheme kanagawa
	autocmd BufWritePre * lua vim.lsp.buf.format()
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
key.set("n", "<Leader>cs", ":nohlsearch<CR>", { silent = true })

local builtin = require("telescope.builtin")
key.set("n", "<Leader>ff", builtin.find_files, {})
key.set("n", "<Leader>fg", builtin.live_grep, {})
key.set("n", "<Leader>fb", builtin.buffers, {})
key.set("n", "<Leader>fh", builtin.help_tags, {})

local kopts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "n",
	[[<Cmd>execute("normal! " . v:count1 . "n")<CR><Cmd>lua require("hlslens").start()<CR>]],
	kopts)
vim.api.nvim_set_keymap("n", "N",
	[[<Cmd>execute("normal! " . v:count1 . "N")<CR><Cmd>lua require("hlslens").start()<CR>]],
	kopts)
vim.api.nvim_set_keymap("n", "*", [[*<Cmd>lua require("hlslens").start()<CR>]], kopts)
vim.api.nvim_set_keymap("n", "#", [[#<Cmd>lua require("hlslens").start()<CR>]], kopts)
vim.api.nvim_set_keymap("n", "g*", [[g*<Cmd>lua require("hlslens").start()<CR>]], kopts)
vim.api.nvim_set_keymap("n", "g#", [[g#<Cmd>lua require("hlslens").start()<CR>]], kopts)
vim.api.nvim_set_keymap("n", "<Leader>l", "<Cmd>noh<CR>", kopts)
