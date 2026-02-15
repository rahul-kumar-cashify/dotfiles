return {
	"jiaoshijie/undotree",
	dependencies = "nvim-lua/plenary.nvim",
	keys = {
		{ "<leader>u", "<cmd>lua require('undotree').toggle()<cr>", desc = "Undotree toggle" },
	},
	opts = {
		-- Disable floating diff: biggest speedup (no diff on every move)
		float_diff = false,
		parser = "compact",
		window = { width = 0.25, height = 0.25 },
	},
	config = function(_, opts)
		require("undotree").setup(opts)
	end,
}