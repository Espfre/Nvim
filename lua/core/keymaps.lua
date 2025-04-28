-- ~/.config/nvim/lua/core/keymaps.lua

-- Helpfunction for normal and insert mode maps
local function nmap(lhs, rhs, desc)
	vim.keymap.set("n", lhs, rhs, { noremap = true, silent = true, desc = desc })
end

local function imap(lhs, rhs, desc)
	vim.keymap.set("i", lhs, rhs, { noremap = true, silent = true, desc = desc })
end

--  Navigation
nmap("<C-d>", "<C-d>zz", "Half page down, centered")
nmap("<C-u>", "<C-u>zz", "Half page up, centered")
nmap("n", "nzzzv", "Next search, centered")
nmap("N", "Nzzzv", "Prev search, centered")
nmap("J", "mzJ`z", "Join lines (keep cursor pos)")

-- Window Navigation
nmap("<C-h>", "<C-w>h", "Move to left window")
nmap("<C-l>", "<C-w>l", "Move to right window")
nmap("<C-j>", "<C-w>j", "Move to lower window")
nmap("<C-k>", "<C-w>k", "Move to upper window")

--- Diagnostic
nmap("<leader>ld", vim.diagnostic.open_float, "Line diagnostic (float)")

-- File operations
nmap("<leader>w", ":w<CR>", "Save file")
nmap("<leader>q", ":q<CR>", "Quit")
nmap("<leader>r", ":so %<CR>", "Reload current file")
nmap("<leader>n", ":noh<CR>", "Clear search highlights")

-- File explorer
nmap("<leader>e", "<cmd>Neotree toggle<CR>", "Toggle Neo-tree")

-- Buffers
nmap("<leader>bn", ":enew<CR>", "New buffer")
nmap("<leader>bd", ":bdelete<CR>", "Delete buffer")
nmap("<Tab>", ":bnext<CR>", "Next buffer")
nmap("<S-Tab>", ":bprevious<CR>", "Previous buffer")

-- Splits
nmap("|", ":vsplit<CR>", "Vertical split")
nmap("-", ":split<CR>", "Horizontal split")

-- Telescope
nmap("<leader>ff", "<cmd>Telescope find_files<CR>", "Find files")
nmap("<leader>fg", "<cmd>Telescope live_grep<CR>", "Live grep")
nmap("<leader>fb", "<cmd>Telescope buffers<CR>", "Find buffers")
nmap("<leader>fh", "<cmd>Telescope help_tags<CR>", "Help tags")

-- Misc utils
nmap("<leader>?", "<cmd>WhichKey<CR>", "Show which-key popup")
nmap("<leader>vpp", "<cmd>e ~/.config/nvim/lua/core/plugins.lua<CR>", "Edit plugin config")
nmap("<leader>vpi", "<cmd>Lazy<CR>", "Open Lazy")

-- Insert mode
imap("jk", "<ESC>", "Exit insert mode")
