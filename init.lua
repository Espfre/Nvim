-- ~/.config/nvim/init.lua

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("core.options")
require("core.keymaps")
require("core.plugins")
require("core.highlight")
require("luasnip.loaders.from_vscode").lazy_load()
require("core.lsp")
require("core.format")
