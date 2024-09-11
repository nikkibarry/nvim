return {
	{
		"rcarriga/nvim-notify",
		keys = {
			{
				"<leader>nu",
				function()
					require("notify").dismiss({ silent = true, pending = true })
				end,
				desc = "Dismiss notifications",
			},
		},
		opts = {
			max_width = 50,
			render = "wrapped-compact",
		},
		init = function()
			vim.notify = require("notify")
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim",
		},
		keys = {
			{
				"<C-f>",
				"<cmd>Neotree toggle<cr>",
				desc = "Toggle Neotree",
			},
		},
		opts = {
			use_popups_for_input = false,
			sort_case_insensitive = true,
			filesystem = {
				filtered_tiems = {
					visible = true,
				},
			},
		},
		window = {
			mappings = {
				["P"] = {
					"toggle_preview",
					config = { use_float = false, use_image_nvim = true },
				},
			},
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"ThePrimeagen/harpoon",
			"letieu/harpoon-lualine",
		},
		opts = function()
			local opts = {
				options = {
					theme = "auto",
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch" },
					lualine_c = {
						"filename",
						{
							"diagnostics",
							sources = {
								"nvim_lsp",
								"nvim_diagnostic",
							},
						},
					},
					lualine_x = {
						{
							"filetype",
							colored = true,
						},
					},
					lualine_y = {
						"harpoon2",
					},
					lualine_z = { "location" },
				},
				extensions = {
					"quickfix",
					"neo-tree",
					"trouble",
					"fugitive",
					"lazy",
					"mason",
				},
			}
			return opts
		end,
	},
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
	{
		"akinsho/bufferline.nvim",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"famiu/bufdelete.nvim",
		},
		opts = {
			options = {
				separator_style = "slope",
				offsets = {
					{
						filetype = "neo-tree",
						text = "NeoTree",
						text_align = "center",
					},
				},
				show_buffer_icons = false,
				close_command = function(bufnum)
					require("bufdelete").bufdelete({ bufnum, true })
				end,
			},
		},
		keys = {
			{ "<leader>b", "", desc = "Buffers" },
			{
				"<leader>bc",
				function()
					require("bufdelete").bufdelete(0, true)
				end,
				desc = "close buffer",
			},
			{
				"<leader>bo",
				"<cmd>BufferLineCloseOthers<cr>",
				desc = "Close other buffers",
			},
			{
				"<leader>bl",
				"<cmd>BufferLineCycleNext<cr>",
				desc = "Next Buffer",
			},
			{
				"<leader>bh",
				"<cmd>BufferLineCyclePrev<cr>",
				desc = "Previous Buffer",
			},
		},
	},
	{
		"folke/zen-mode.nvim",
		opts = {},
	},
	{
		"folke/twilight.nvim",
		opts = {},
	},
	{
		"m4xshen/smartcolumn.nvim",
		opts = {
			colorcolumn = "80",
			disable_filetypes = {
				"help",
				"lazy",
				"neo-tree",
				"mason",
				"lspinfo",
				"trouble",
				"text",
			},
		},
	},
	{
		"dstein64/nvim-scrollview",
		config = function()
			require("scrollview").setup({
				excluded_filetypes = {
					"neo-tree",
				},
				current_only = true,
				diagnostics_error_symbol = "✘",
				diagnostics_warn_symbol = "▲",
				diagnostics_hint_symbol = "⚑",
				diagnostics_info_symbol = "»",
			})
		end,
	},
}
