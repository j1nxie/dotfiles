vim.g.mapleader = " "
vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")

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

vim.keymap.set("n", "<leader>gg", "<Cmd>LazyGit<CR>", { silent = true })

vim.keymap.set("", "H", "^")
vim.keymap.set("", "L", "$")

vim.keymap.set("n", "<F5>", "<Cmd>Neotree<CR>", { silent = true })
vim.keymap.set("n", "<Leader>cs", "<Cmd>nohlsearch<CR>", { silent = true })

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<Leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<Leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<Leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<Leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<Leader>fe", "<Cmd>Telescope emoji<CR>", { silent = true })

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

vim.keymap.set("n", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "next todo comment" })
vim.keymap.set("n", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "previous todo comment" })
