return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Lua
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
		})

		-- Python
		lspconfig.pyright.setup({
			capabilities = capabilities,
		})

		-- HTML
		lspconfig.html.setup({
			capabilities = capabilities,
		})

		-- CSS
		lspconfig.cssls.setup({
			capabilities = capabilities,
		})
	end,
}
