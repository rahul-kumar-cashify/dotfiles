return {
	{ "rose-pine/neovim", name = "rose-pine", lazy = false, priority = 1000 },
	{ "folke/tokyonight.nvim", lazy = false, priority = 1000 },
	{ "catppuccin/nvim", name = "catppuccin", lazy = false, priority = 1000 },
	{ "ellisonleao/gruvbox.nvim", lazy = false, priority = 1000 },
	{ "navarasu/onedark.nvim", lazy = false, priority = 1000 },
	{ "EdenEast/nightfox.nvim", lazy = false, priority = 1000 },
	{ "rebelot/kanagawa.nvim", lazy = false, priority = 1000 },
	{ "sainnhe/gruvbox-material", lazy = false, priority = 1000 },
	{ "sainnhe/everforest", lazy = false, priority = 1000 },
	{ "bluz71/vim-moonfly-colors", lazy = false, priority = 1000 },
	{ "thesimonho/kanagawa-paper.nvim", lazy = false, priority = 1000 },

	-- Themery
	{
		"zaldih/themery.nvim",
		lazy = false,
		priority = 900,
		config = function()
			-- If you want a consistent Visual selection across all themes, keep this.
			-- If you want each theme's native Visual, delete this whole autocmd.
			local function apply_visual()
				vim.opt.termguicolors = true
				vim.api.nvim_set_hl(0, "Visual", { bg = "#FFD700", fg = "#000000" })
			end
			vim.api.nvim_create_autocmd("ColorScheme", { callback = apply_visual })

			require("themery").setup({
				themes = {
					-- rose-pine
					{ name = "Rose Pine", colorscheme = "rose-pine" },
					{ name = "Rose Pine Moon", colorscheme = "rose-pine-moon" },
					{ name = "Rose Pine Dawn", colorscheme = "rose-pine-dawn" },

					-- tokyonight
					{ name = "Tokyonight", colorscheme = "tokyonight" },

					-- catppuccin
					{ name = "Catppuccin", colorscheme = "catppuccin" },

					-- gruvbox.nvim
					{ name = "Gruvbox (ellisonleao)", colorscheme = "gruvbox" },

					-- onedark
					{ name = "OneDark", colorscheme = "onedark" },

					-- nightfox family
					{ name = "Nightfox", colorscheme = "nightfox" },
					{ name = "Dawnfox", colorscheme = "dawnfox" },
					{ name = "Dayfox", colorscheme = "dayfox" },
					{ name = "Duskfox", colorscheme = "duskfox" },
					{ name = "Nordfox", colorscheme = "nordfox" },
					{ name = "Terafox", colorscheme = "terafox" },
					{ name = "Carbonfox", colorscheme = "carbonfox" },

					-- kanagawa.nvim family
					{ name = "Kanagawa Wave", colorscheme = "kanagawa-wave" },
					{ name = "Kanagawa Dragon", colorscheme = "kanagawa-dragon" },
					{ name = "Kanagawa Lotus", colorscheme = "kanagawa-lotus" },

					-- NEW: gruvbox-material
					{ name = "Gruvbox Material", colorscheme = "gruvbox-material" },

					-- NEW: everforest
					{ name = "Everforest", colorscheme = "everforest" },

					-- NEW: moonfly
					{ name = "Moonfly", colorscheme = "moonfly" },

					-- NEW: kanagawa-paper
					-- (this one’s colorscheme name is typically "kanagawa-paper")
					{ name = "Kanagawa Paper", colorscheme = "kanagawa-paper" },
				},

				livePreview = true,
			})

			vim.keymap.set("n", "<leader>ut", "<cmd>Themery<CR>", { desc = "Themery: pick theme" })
		end,
	},
}
