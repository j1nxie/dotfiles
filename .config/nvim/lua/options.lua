vim.g.mapleader = " "
vim.o.background = ""
vim.cmd [[
	filetype plugin indent on
	syntax enable
	colorscheme kanagawa
	autocmd BufWritePre * lua vim.lsp.buf.format()
]]

vim.opt.termguicolors = true
vim.opt.guifont = "FiraCode Nerd Font Mono:style=Bold,Regular:h12"
vim.opt.clipboard = "unnamed,unnamedplus"
vim.opt.fileformats = "unix,dos"
vim.opt.fileformat = "unix"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.hidden = true
vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.cmdheight = 1
vim.opt.showmode = false
vim.opt.updatetime = 50
vim.opt.shortmess = vim.opt.shortmess + "c"
vim.opt.signcolumn = "yes"
vim.opt.showtabline = 2
vim.opt.scrolloff = 2
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.joinspaces = false
vim.opt.showtabline = 1
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")
vim.opt.colorcolumn = "80"

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
