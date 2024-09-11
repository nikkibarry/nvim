return {
	{
		"mistricky/codesnap.nvim",
		build = "make",
		opts = {
			save_path = "~/Desktop",
			has_line_number = true,
			bg_theme = "grape",
			watermark = "",
		},
		keys = {
			{
				"<leader>sp",
				"<cmd>CodeSnap<cr>",
				mode = "x",
				desc = "Snap to Clipboard",
			},
			{
				"<leader>sps",
				"<cmd>CodeSnapSave",
				mode = "x",
				desc = "Snap to File",
			},
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufNewFile", "BufReadPre" },
		main = "ibl",
		opts = {
			indent = {
				char = "|",
			},
			exclude = {
				filetypes = {
					"aerial",
					"help",
					"lazy",
					"mason",
					"neo-tree",
					"notify",
					"TelescopePrompt",
				},
			},
		},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			check_ts = true,
			disable_filetype = {
				"aerial",
				"help",
				"lazy",
				"mason",
				"neo-tree",
				"notify",
				"TelescopePrompt",
			},
		},
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("ts_context_commentstring").setup({
				enable_autocmd = false,
			})
		end,
	},
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("Comment").setup({
				pre_hook = require(
					"ts_context_commentstring.integrations.comment_nvim"
				).create_pre_hook(),
			})
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim/plenary.nvim" },
		event = { "BufNewFile", "BufReadPre" },
		opts = {},
		keys = {
			{
				"<leader>td",
				"<cmd>TodoTelescope<cr>",
				desc = "todos",
			},
		},
	},
	{
		"echasnovski/mini.align",
		event = { "BufNewFile", "BufReadPre" },
		opts = {
			mappings = {
				start = "gb",
				start_with_preview = "gB",
			},
		},
	},
	{
		"echasnovski/mini.surround",
		event = { "BufNewFile", "BufReadPre" },
		opts = {
			mappings = {
				add = "<leader>wa",
				delete = "<leader>wd",
				find = "<leader>wf",
				find_left = "<leader>wF",
				highlight = "<leader>wh",
				replace = "<leader>wr",
				suffix_last = "l",
				suffix_next = "n",
				update_n_lines = "<leader>wn",
			},
		},
	},
	{
		"johmsalas/text-case.nvim",
		dependencies = "nvim-telescope/telescope.nvim",
		event = { "BufNewFile", "BufReadPre" },
		config = function()
			require("textcase").setup({})
			require("telescope").load_extension("textcase")
		end,
		keys = {
			"ga",
			{
				"ga.",
				"<cmd>TextCaseOpenTelescope<cr>",
				mode = { "n", "x" },
				desc = "Text Case Telescope",
			},
		},
		cmd = {
			"TextCaseOpenTelescope",
			"TextCaseOpenTelescopeLSPChange",
			"TextCaseOpenTelescopeQuickChange",
			"TextCaseStartReplacingCommand",
		},
		lazy = false,
	},
	{
		"Wansmer/treesj",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesj").setup({
				use_default_keymaps = false,
				max_join_length = 80,
			})
		end,
		keys = {
			{
				"<leader>j",
				function()
					require("treesj").toggle()
				end,
				desc = "Join/Split",
			},
		},
	},
	{
		"stevearc/aerial.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{
				"<leader>ta",
				"<cmd>AerialNavToggle<cr>",
				desc = "Toggle Aerial",
			},
		},
	},
}
