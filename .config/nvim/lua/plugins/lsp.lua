return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
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
			"onsails/lspkind.nvim",
		},
		function()
			local lsp = require("lsp-zero").preset({
				name = "recommended",
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
			local lspkind = require("lspkind")
			local luasnip = require("luasnip")
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
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" })
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
				},
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol_text",
						max_width = 50,
						ellipsis_char = "..."
					})
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

			lsp.configure("stylelint_lsp", {
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
			vim.diagnostic.config({
				virtual_text = false,
			})
		end
	},
}
