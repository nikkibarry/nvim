return {
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				["*"] = { "cspell" },
				c = { "cpplint" },
				cpp = { "cpplint" },
				dockerfile = { "hadolint" },
				htmldjango = { "djlint" },
				javascript = { "eslint_d" },
				json = { "jsonlint" },
				markdown = { "markdownlint" },
				python = { "mypy", "pydocstyle", "flake8" },
				typescript = { "eslint_d" },
				yaml = { "yamllint" },
			}
			lint.linters.mypy.args = {
				"--show-column-numbers",
				"--show-error-end",
				"--show-error-code-links",
				"--hide-error-context",
				"--no-color-output",
				"--no-error-summary",
				"--check-untyped-defs",
				"--no-pretty",
				"--python-executable",
				function()
					return vim.fn.exepath("python3")
						or vim.fn.exepath("python")
				end,
			}
			local lint_augroup =
				vim.api.nvim_create_augroup("lint", { clear = true })
			vim.api.nvim_create_autocmd({
				"BufEnter",
				"BufWritePost",
				"InsertLeave",
			}, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})
		end,
		keys = {
			{
				"<leader>l",
				function()
					require("lint").try_lint()
				end,
				desc = "lint",
			},
		},
	},
	{
		"rshkarin/mason-nvim-lint",
		event = { "BufNewFile", "BufReadPre" },
		dependencies = {
			"mfussenegger/nvim-lint",
		},
		config = function()
			require("mason-nvim-lint").setup({
				ensure_installed = {
					"cspell",
					"cpplint",
					"djlint",
					"eslint_d",
					"flake8",
					"hadolint",
					"jsonlint",
					"markdownlint",
					"mypy",
					"pydocstyle",
					"yamllint",
				},
				automatic_installation = true,
				quiet_mode = false,
			})
		end,
	},
}
