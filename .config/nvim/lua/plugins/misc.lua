return {
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
		"saecki/crates.nvim",
		requires = "nvim-lua/plenary.nvim",
		function()
			require("crates").setup()
		end
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
		"kevinhwang91/nvim-hlslens",
		requires = "petertriho/nvim-scrollbar",
		function()
			require("hlslens").setup()
			require("scrollbar.handlers.search").setup()
		end
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		function()
			vim.opt.list = true
			vim.opt.listchars:append "space:·"
			require("indent_blankline").setup({
				char_blankline = "",
				space_char_blankline = "",
				show_current_context = true,
				use_treesitter = true,
			})
		end
	},
	{
		"m4xshen/smartcolumn.nvim",
		function()
			require("smartcolumn").setup()
		end
	},
	"kdheepak/lazygit.nvim",
	"wakatime/vim-wakatime",
	"ludovicchabant/vim-gutentags"
}