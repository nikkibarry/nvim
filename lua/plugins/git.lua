return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			signcolumn = true,
		},
		keys = {
			{
				"<leader>g",
				"",
				desc = "git",
			},
			{
				"<leader>gp",
				"<cmd>Gitsigns preview_hunk<CR>",
				desc = "git preview",
			},
			{
				"<leader>gl",
				"<cmd>Gitsigns toggle_current_line_blame<cr>",
				desc = "git line blame",
			},
		},
	},
	{
		"tpope/vim-fugitive",
	},
	{
		"jsongerber/thanks.nvim",
		config = true,
	},
}
