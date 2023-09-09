vim.opt.clipboard = "unnamed,unnamedplus"

vim.g.mapleader = " "

vim.keymap.set("n", "<C-h>", "<Cmd>call VSCodeCall('workbench.action.navigateLeft')<CR>")
vim.keymap.set("n", "<C-j>", "<Cmd>call VSCodeCall('workbench.action.navigateDown')<CR>")
vim.keymap.set("n", "<C-k>", "<Cmd>call VSCodeCall('workbench.action.navigateUp')<CR>")
vim.keymap.set("n", "<C-l>", "<Cmd>call VSCodeCall('workbench.action.navigateRight')<CR>")

vim.keymap.set("n", "<up>", "<nop>")
vim.keymap.set("n", "<down>", "<nop>")
vim.keymap.set("i", "<up>", "<nop>")
vim.keymap.set("i", "<down>", "<nop>")
vim.keymap.set("i", "<left>", "<nop>")
vim.keymap.set("i", "<right>", "<nop>")

vim.keymap.set("n", "<left>", "<Cmd>bp<CR>")
vim.keymap.set("n", "<right>", "<Cmd>bn<CR>")

vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

vim.keymap.set("", "H", "^")
vim.keymap.set("", "L", "$")

vim.keymap.set("n", "<Leader>fg", "<Cmd>call VSCodeCall('workbench.action.findInFiles')<CR>")
