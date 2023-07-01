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
		"HiPhish/nvim-ts-rainbow2",
		requires = "nvim-treesitter/nvim-treesitter",
	},
}
