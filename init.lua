-- ~/.config/nvim/init.lua

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("core.options")
require("core.keymaps")
require("plugins")
require("core.highlight")
require("core.luasnip")
