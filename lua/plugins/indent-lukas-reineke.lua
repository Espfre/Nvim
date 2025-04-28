-- Lukas indent blankline
return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {
		indent = { char = "⸽" },
		scope = {
			enabled = true,
			show_start = true,
			show_end = false,
			highlight = { "Function", "Label" },
		},
		whitespace = {
			remove_blankline_trail = true,
		},
		exclude = {
			filetypes = { "dashboard", "help", "lazy", "alpha" },
		},
	},
}
