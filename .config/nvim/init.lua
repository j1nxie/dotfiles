require("bootstrap")
require("dep") {
	modules = {
		prefix = "plugins.",
		"treesitter",
		"telescope",
		"lsp",
		"misc"
	}
}
require("keymaps")
require("options")
