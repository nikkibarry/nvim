return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufNewFile", "BufReadPre" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = function()
			local treesitter = require("nvim-treesitter.configs")
			treesitter.setup({
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
					disable = {
						"neo-tree",
						"notify",
					},
				},
				ensure_installed = {
					"bash",
					"c",
					"cmake",
					"comment",
					"cpp",
					"css",
					"csv",
					"diff",
					"dockerfile",
					"git_config",
					"git_rebase",
					"gitattributes",
					"gitcommit",
					"gitignore",
					"go",
					"html",
					"htmldjango",
					"http",
					"ini",
					"java",
					"javascript",
					"json",
					"json5",
					"lua",
					"luadoc",
					"markdown",
					"markdown_inline",
					"python",
					"query",
					"requirements",
					"ron",
					"rust",
					"scss",
					"smithy",
					"sql",
					"toml",
					"tsx",
					"typescript",
					"vim",
					"vimdoc",
					"xml",
					"yaml",
					"zig",
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["ab"] = {
								query = "@block.outer",
								desc = "Outer block",
							},
							["ac"] = {
								query = "@class.outer",
								desc = "Outer class",
							},
							["ad"] = {
								query = "@conditional.outer",
								desc = "Outer conditional",
							},
							["af"] = {
								query = "@function.outer",
								desc = "Outer function",
							},
							["al"] = {
								query = "@loop.outer",
								desc = "Outer loop",
							},
							["ap"] = {
								query = "@parameter.outer",
								desc = "Outer parameter",
							},
							["as"] = {
								query = "@statement.outer",
								desc = "Statement",
							},
							["ib"] = {
								query = "@block.inner",
								desc = "Inner block",
							},
							["ic"] = {
								query = "@class.inner",
								desc = "Inner class",
							},
							["id"] = {
								query = "@conditional.inner",
								desc = "inner conditional",
							},
							["if"] = {
								query = "@function.inner",
								desc = "Inner function",
							},
							["il"] = {
								query = "@loop.inner",
								desc = "Inner loop",
							},
							["ip"] = {
								query = "@parameter.inner",
								desc = "Inner parameter",
							},
						},
						include_surrounding_whitespace = true,
					},
					move = {
						enable = true,
						set_jumps = true,
						goto_next_start = {
							["]m"] = "@function.outer",
							["]o"] = "@loop.outer",
							["]c"] = "@class.outer",
						},
						goto_next_end = {
							["]M"] = "@function.outer",
							["]O"] = "@loop.outer",
							["]C"] = "@class.outer",
						},
						goto_previous_start = {
							["[m"] = "@function.outer",
							["[o"] = "@loop.outer",
							["[c"] = "@class.outer",
						},
						goto_previous_end = {
							["[M"] = "@function.outer",
							["[O"] = "@loop.outer",
							["[C"] = "@class.outer",
						},
						goto_next = {
							["]d"] = "@conditional.outer",
						},
						goto_previous = {
							["[d"] = "@conditional.outer",
						},
					},
					swap = {
						enable = true,
						swap_next = {
							["<leader>ss"] = "@parameter.inner",
						},
						swap_previous = {
							["<leader>sS"] = "@parameter.inner",
						},
					},
					lsp_interop = {
						enable = true,
						peek_definition_code = {
							["<leader>df"] = "@function.outer",
							["<leader>dF"] = "@class.outer",
						},
					},
				},
			})
		end,
		keys = {
			{
				"<leader>s",
				"",
				desc = "Swap",
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = { "BufNewFile", "BufReadPre" },
		config = function()
			require("treesitter-context").setup({
				enable = true,
				line_numbers = true,
				max_lines = 3,
				mode = "cursor",
				separator = "-",
				trim_scope = "outer",
			})
		end,
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
		event = { "BufNewFile", "BufReadPre" },
	},
	{
		"windwp/nvim-ts-autotag",
		event = { "BufNewFile", "BufReadPre" },
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true,
					enable_close_on_stash = false,
					enable_rename = true,
				},
			})
		end,
	},
}
