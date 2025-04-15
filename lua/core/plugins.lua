-- ~/.config/nvim/lua/core/plugins.lua

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

require("lazy").setup({

	-- Lukas indent blankline
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = { char = "⸽" },
			scope = { enabled = true },
		},
	},

	--  TokyoNight theme
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme tokyonight-night")
		end,
	},

	{
		"neovim/nvim-lspconfig",
	},

	--  Treesitter + rainbow parens
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"HiPhish/nvim-ts-rainbow2",
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"bash",
					"vim",
					"markdown",
					"json",
					"yaml",
					"html",
					"css",
					"javascript",
					"typescript",
					"python",
					"tsx",
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				rainbow = {
					enable = true,
					query = {
						lua = "rainbow-parens",
						javascript = "rainbow-parens",
						typescript = "rainbow-parens",
						python = "rainbow-parens",
						html = "rainbow-parens",
						tsx = "rainbow2",
					},
					strategy = {
						[""] = require("ts-rainbow.strategy.global"),
					},
				},
			})
		end,
	},

	--  Mason (LSP installer)
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	--  Which-key (keybind-hints)
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup()
		end,
	},

	-- 🔍 Telescope (Fuzzy finder)
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	--  Neo-tree (filebrowser)
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({
				window = {
					position = "left",
					width = 30,
				},
				filesystem = {
					filtered_items = {
						visible = true,
						hide_dotfiles = false,
						hide_gitignored = true,
					},
				},
			})
		end,
	},

	{
		"HiPhish/rainbow-delimiters.nvim",
		config = function()
			local rainbow_delimiters = require("rainbow-delimiters")

			vim.g.rainbow_delimiters = {
				strategy = {
					[""] = rainbow_delimiters.strategy["global"],
					vim = rainbow_delimiters.strategy["local"],
				},
				query = {
					[""] = "rainbow-delimiters",
					lua = "rainbow-blocks", -- extra magic for lua
				},
				highlight = {
					"TSRainbowRed",
					"TSRainbowYellow",
					"TSRainbowBlue",
					"TSRainbowOrange",
					"TSRainbowGreen",
					"TSRainbowViolet",
					"TSRainbowCyan",
				},
			}
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer", keyword_lengt = 2 },
					{ name = "path" },
				}),
			})
		end,
	},

	--  Lualine (statusline)
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					theme = "tokyonight",
					section_separators = "",
					component_separators = "",
				},
			})
		end,
	},

	{
		"stevearc/conform.nvim",
		opts = {},
	},

	--  Alpha dashboard
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			dashboard.section.header.val = {

				[[                   -`                      ]],
				[[                  .o+`                     ]],
				[[                 `ooo/                     ]],
				[[                `+oooo:                    ]],
				[[               `+oooooo:                   ]],
				[[               -+oooooo+:                  ]],
				[[             `/:-:++oooo+:                 ]],
				[[            `/++++/+++++++:                ]],
				[[           `/++++++++++++++:               ]],
				[[          `/+++ooooooooooooo/`             ]],
				[[         ./ooosssso++osssssso+`            ]],
				[[        .oossssso-````/ossssss+`           ]],
				[[       -osssssso.      :ssssssso.          ]],
				[[      :osssssss/        osssso+++.         ]],
				[[     /ossssssss/        +ssssooo/-         ]],
				[[   `/ossssso+/:-        -:/+osssso+-       ]],
				[[  `+sso+:-`                 `.-/+oso:      ]],
				[[ `++:.                           `-/+/     ]],
				[[ .`                                 `/     ]],
			}

			-- Color highlights
			dashboard.section.header.opts.hl = "AlphaHeader"
			dashboard.section.buttons.opts.hl = "AlphaButtons"
			dashboard.section.footer.opts.hl = "AlphaFooter"

			vim.cmd([[highlight AlphaHeader guifg=#c678dd]]) -- Purple Arch logo
			vim.cmd([[highlight AlphaButtons guifg=#7dcfff]]) -- Cyan buttons
			vim.cmd([[highlight AlphaFooter guifg=#a6e3a1]]) -- Minty footer

			-- Buttons
			dashboard.section.buttons.val = {
				dashboard.button("e", "  New file", ":ene <BAR> startinsert<CR>"),
				dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
				dashboard.button("r", "  Recent", ":Telescope oldfiles<CR>"),
				dashboard.button("q", "  Quit", ":qa<CR>"),
			}

			-- Footer message
			dashboard.section.footer.val = "💜 Archified. Riced. Ready to code."

			-- Load dashboard
			alpha.setup(dashboard.config)
		end,
	},
})
