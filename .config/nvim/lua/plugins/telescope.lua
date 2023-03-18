return {
	{
		"nvim-telescope/telescope.nvim",
		deps = {
			"xiyaowong/telescope-emoji.nvim",
		},
		branch = "0.1.x",
		function()
			require("telescope").setup({
				pickers = {
					find_files = {
						theme = "dropdown",
					},
					live_grep = {
						theme = "dropdown",
					}
				}
			})
		end
	},
	{
		"xiyaowong/telescope-emoji.nvim",
		requires = "nvim-telescope/telescope.nvim",
		function()
			require("telescope").load_extension("emoji")
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
}
