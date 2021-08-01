require "nvim-treesitter.configs".setup {
	ensure_installed = "maintained",
	indent = { enable = {"javascriptreact", "typescriptreact"} },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true
	}
}

