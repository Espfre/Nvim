--  Treesitter + rainbow parens
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"lua",
				"bash",
				"vim",
				"markdown",
				"json",
				"yaml",
				"html",
				"css",
				"javascript",
				"typescript",
				"python",
				"tsx",
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		})
	end,
}
