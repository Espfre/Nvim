-- ~/.config/nvim/lua/core/plugins/init.lua

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
require("lazy").setup({
	require("plugins.tokyonight"),
	require("plugins.lspconfig"),
	require("plugins.telescope"),
	require("plugins.indent-lukas-reineke"),
	require("plugins.treesitter"),
	require("plugins.mason"),
	require("plugins.mason-lspconfig"),
	require("plugins.which-key"),
	require("plugins.neotree"),
	require("plugins.rainbow-delimiters"),
	require("plugins.lualine"),
	require("plugins.colorizer"),
	require("plugins.cmp"),
	require("plugins.conform"),
	require("plugins.dashboard"),
})
