return {
	{
		"toppair/peek.nvim",
		event = "VeryLazy",
		build = "deno task --quiet build:fast",
		config = function()
			require("peek").setup()
			vim.api.nvim_create_user_command(
				"PeekClose",
				require("peek").close,
				{}
			)
			vim.api.nvim_create_user_command(
				"PeekOpen",
				require("peek").open,
				{}
			)
		end,
	},
	{
		"danymat/neogen",
		event = { "BufNewFile", "BufReadPre" },
		config = true,
	},
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"nvim-telescope/telescope.nvim",
		},
		branch = "regexp",
		config = function()
			require("venv-selector").setup({})
		end,
		keys = {
			{ "<leader>vs", "<cmd>VenvSelect<cr>" },
		},
	},
}
