-- ~/.config/nvim/lua/core/format.lua

require("conform").setup({
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		tsx = { "prettier" },
		json = { "prettier" },
		html = { "prettier" },
		css = { "prettier" },
		sh = { "shfmt" },
		markdown = { "prettier" },
	},
})
