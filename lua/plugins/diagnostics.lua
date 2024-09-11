return {
	{
		"folke/trouble.nvim",
		event = { "BufNewFile", "BufReadPre" },
		opts = {
			modes = {
				preview_float = {
					mode = "diagnostics",
					preview = {
						border = "rounded",
						position = { 0, -2 },
						relative = "editor",
						size = { width = 0.3, height = 0.3 },
						title = "Preview",
						title_pos = "center",
						type = "float",
						zindex = 200,
					},
				},
			},
		},
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
		},
	},
	{
		"ravibrock/spellwarn.nvim",
		event = "VeryLazy",
		config = true,
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		config = function()
			require("tiny-inline-diagnostic").setup({
				options = {
					break_line = {
						enabled = true,
						after = 30,
					},
				},
			})
		end,
	},
}
