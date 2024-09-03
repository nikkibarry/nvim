return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"andrew-george/telescope-themes",
		config = function()
			require("telescope").load_extension("themes")
		end,
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
}
