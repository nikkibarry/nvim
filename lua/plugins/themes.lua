return {
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "folke/tokyonight.nvim", priority = 1000 },
	{ "sainnhe/gruvbox-material", priority = 1000 },
	{ "sho-87/kanagawa-paper.nvim", priority = 1000 },
	{
		"rachartier/tiny-devicons-auto-colors.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		event = "VeryLazy",
		config = function()
			require("tiny-devicons-auto-colors").setup({
				cache = {
					enabled = true,
					path = vim.fn.stdpath("cache")
						.. "/tiny-devicons-auto-colors-cache.json",
				},
				autoreload = true,
			})
		end,
	},
}
