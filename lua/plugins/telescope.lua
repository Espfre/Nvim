-- Telescope (Fuzzy finder)
return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").setup({
			defaults = {
				layout_strategy = "horizontal",
				layout_config = {
					prompt_position = "top",
				},
				sorting_strategy = "ascending",
				file_ignor_patterns = { "node_modules", ".git/" },
				prompt_prefix = "🔍 ",
				selection_caret = " ",
			},
		})
	end,
}
