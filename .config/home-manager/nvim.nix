{...}: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraLuaConfig = ''
      vim.g.mapleader = "<Space>"
      vim.cmd [[
        filetype plugin indent on
        syntax enable
      ]]

      vim.opt.termguicolors = true
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

      vim.keymap.set("", "H", "^")
      vim.keymap.set("", "L", "$")
    '';
  };
}
