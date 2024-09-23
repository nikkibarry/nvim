return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {},
	},
	{
		"AckslD/nvim-neoclip.lua",
		dependencies = {
			{ "nvim-telescope/telescope.nvim" },
		},
		config = function()
			require("neoclip").setup({
				default_register = { '"', "+", "*" },
			})
		end,
	},
	{
		"sqve/sort.nvim",
		event = "VeryLazy",
	},
	{
		"numToStr/FTerm.nvim",
		config = function()
			require("FTerm").setup({
				border = "double",
				height = 0.5,
				width = 0.9,
			})
		end,
		keys = {
			{
				"<leader>z",
				function()
					require("FTerm").toggle()
				end,
				desc = "Terminal",
			},
		},
	},
	{
		"jiaoshijie/undotree",
		dependencies = "nvim-lua/plenary.nvim",
		config = true,
		keys = {
			{
				"<leader>u",
				"<cmd>lua require('undotree').toggle()<cr>",
				desc = "Undo Tree",
			},
		},
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			local harpoon = require("harpoon")
			harpoon.setup({})
			local conf = require("telescope.config").values
			local function toggle_telescope(harpoon_files)
				local file_paths = {}
				for _, item in ipairs(harpoon_files.items) do
					table.insert(file_paths, item.value)
				end
				require("telescope.pickers")
					.new({}, {
						prompt_title = "Harpoon",
						finder = require("telescope.finders").new_table({
							results = file_paths,
						}),
						previewer = conf.file_previewer({}),
						sorter = conf.generic_sorter({}),
					})
					:find()
			end
			vim.keymap.set("n", "<leader>ha", function()
				harpoon:list():add()
			end, { desc = "Add harpoon" })
			vim.keymap.set("n", "<leader>hh", function()
				harpoon:list():prev()
			end, { desc = "Prev Harpoon" })
			vim.keymap.set("n", "<leader>hl", function()
				harpoon:list():next()
			end, { desc = "Next Harpoon " })
			vim.keymap.set("n", "<leader>hd", function()
				harpoon:list():remove()
			end, { desc = "Remove Harpoon" })
			vim.keymap.set("n", "<leader>hw", function()
				toggle_telescope(harpoon:list())
			end, { desc = "Open harppoon window" })
		end,
		keys = {
			{
				"<leader>h",
				"",
				desc = "Harpoon",
			},
		},
	},
	{
		"Aasim-A/scrollEOF.nvim",
		event = { "CursorMoved", "WinScrolled" },
		opts = {},
	},
}
