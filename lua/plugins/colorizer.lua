-- norcalli/nvim-colorizer.lua
return {
	"NvChad/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup({
			filetypes = { "css", "scss", "html", "javascript", "lua" },
			user_default_options = {
				RGB = true, -- #RGB hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				names = true, -- "blue" etc
				RRGGBBAA = true, -- #RRGGBBAA
				rgb_fn = true, -- rgb() and rgba()
				hsl_fn = true, -- hsl() and hsla()
				mode = "background", -- 'background' or 'foreground'
			},
		})
	end,
}
