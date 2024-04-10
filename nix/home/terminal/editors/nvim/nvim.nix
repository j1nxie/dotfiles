{pkgs, ...}: {
  programs.neovim.plugins = with pkgs.unstable.vimPlugins; [
    nvim-lspconfig
    cmp-nvim-lsp
    luasnip
    rustaceanvim
    nvim-cmp
    rainbow-delimiters-nvim
    nvim-scrollbar
    gitsigns-nvim
    nvim-cokeline
    nvim-cursorline
    nvim-scrollbar
    neo-tree-nvim
    nvim-autopairs
    nvim-web-devicons
    {
      plugin = nvim-hlslens;
      type = "lua";
      config = ''
        require('hlslens').setup()
        require('scrollbar.handlers.search').setup()
      '';
    }
    {
      plugin = indent-blankline-nvim;
      type = "lua";
      config = ''
        local highlight = {
          "RainbowRed",
          "RainbowYellow",
          "RainbowBlue",
          "RainbowOrange",
          "RainbowGreen",
          "RainbowViolet",
          "RainbowCyan",
        }
        local hooks = require "ibl.hooks"

        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
          vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
          vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
          vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
          vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
          vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
          vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
          vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
        end)

        vim.g.rainbow_delimiters = { highlight = highlight }
        require("ibl").setup { scope = { highlight = highlight } }

        hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
      '';
    }
    {
      plugin = lualine-nvim;
      type = "lua";
      config = ''
        require('lualine').setup({
          options = {
            theme = 'catppuccin',
            global_status = true,
            section_separators = { left = "", right = "" },
          },
          extensions = { "neo-tree" }
        })

        require('lualine').hide({
          place = { "tabline" },
          unhide = false,
        })
      '';
    }
    {
      plugin = catppuccin-nvim;
      type = "lua";
      config = ''
        require('catppuccin').setup({
          flavour = "auto",
          background = {
            light = "latte",
            dark = "macchiato",
          },
          default_integrations = true,
          integrations = {
            cmp = true,
            gitsigns = true,
            nvimtree = true,
            treesitter = true,
          }
        })

        vim.cmd [[ colorscheme catppuccin-latte ]]
      '';
    }
    {
      plugin = nvim-treesitter.withAllGrammars;
      type = "lua";
      config = ''
        require('nvim-treesitter.configs').setup({
          highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
          },
          rainbow = {
            enable = true,
            extended_mode = true,
          }
        })
      '';
    }
    {
      plugin = lsp-zero-nvim;
      type = "lua";
      config = ''
        local lsp_zero = require('lsp-zero')
        local cmp = require('cmp')

        lsp_zero.on_attach(function(client, bufnr)
          lsp_zero.default_keymaps({buffer = bufnr})
        end)

        lsp_zero.set_sign_icons({
          error = '✘',
          warn = '▲',
          hint = '⚑',
          info = '»'
        })

        cmp.setup({
          sources = {
            { name = "nvim_lsp" }
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
              else
                fallback()
              end
            end, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              else
                fallback()
              end
            end, { "i", "s" })
          }),
          snippet = {
            expand = function(args)
              require("luasnip").lsp_expand(args.body)
            end,
          }
        })

        vim.g.rustaceanvim = {
          server = {
            capabilities = lsp_zero.get_capabilities()
          },
        }

        vim.diagnostic.config({
          virtual_text = false
        })
      '';
    }
  ];
}
