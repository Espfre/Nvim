-- ~/.config/nvim/lua/core/lsp.lua

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Lua (lua_ls)
lspconfig.lua_ls.setup({
  capabilities = capabilities,
})

-- TypeScript & JavaScript (tsserver or tsserver_ts_ls)
lspconfig.ts_ls.setup({
  capabilities = capabilities,
})
-- Python (pyright)
lspconfig.pyright.setup({
  capabilities = capabilities,
})
