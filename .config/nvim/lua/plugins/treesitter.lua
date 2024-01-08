return {
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			vim.cmd("TSUpdate")
		end,
		function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "c", "lua", "vim", "vimdoc" },
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				rainbow = {
					enable = true,
					extended_mode = true,
				}
			})
		end
	},
	"nvim-treesitter/playground",
	{
		"m-demare/hlargs.nvim",
		requires = "nvim-treesitter/nvim-treesitter",
		function()
			require("hlargs").setup()
		end
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
		function()
			local rainbow_delimiters = require("rainbow-delimiters")
			require("rainbow-delimiters.setup").setup({
				strategy = {
					[''] = rainbow_delimiters.strategy['global'],
					vim = rainbow_delimiters.strategy['local'],
				},
				query = {
					[''] = 'rainbow-delimiters',
					lua = 'rainbow-blocks',
				},
				highlight = {
					'RainbowDelimiterRed',
					'RainbowDelimiterYellow',
					'RainbowDelimiterBlue',
					'RainbowDelimiterOrange',
					'RainbowDelimiterGreen',
					'RainbowDelimiterViolet',
					'RainbowDelimiterCyan',
				}
			})
		end
	},
}
