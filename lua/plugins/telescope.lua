return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{
				"<leader>t",
				"",
				desc = "Telescope",
			},
		},
	},
	{
		"andrew-george/telescope-themes",
		config = function()
			require("telescope").load_extension("themes")
		end,
		keys = {
			{
				"<leader>th",
				"<cmd>Telescope themes",
				desc = "Themes",
			},
		},
	},
	{
		"debugloop/telescope-undo.nvim",
		config = function()
			require("telescope").load_extension("undo")
		end,
	},
	{
		"piersolenski/telescope-import.nvim",
		config = function()
			require("telescope").load_extension("import")
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		config = function()
			require("telescope").load_extension("fzf")
		end,
	},
	{
		"tsakirist/telescope-lazy.nvim",
		config = function()
			require("telescope").load_extension("lazy")
		end,
	},
	{
		"nvim-telescope/telescope-frecency.nvim",
		config = function()
			require("telescope").load_extension("frecency")
		end,
	},
	{
		"olacin/telescope-cc.nvim",
		config = function()
			require("telescope").load_extension("conventional_commits")
		end,
	},
	{
		"nvim-telescope/telescope-symbols.nvim",
	},
	{
		"Snikimonkd/telescope-git-conflicts.nvim",
		config = function()
			require("telescope").load_extension("conflicts")
		end,
	},
	{
		"crispgm/telescope-heading.nvim",
		config = function()
			require("telescope").load_extension("heading")
		end,
	},
}
