return {
	{
		"zapling/mason-conform.nvim",
		event = { "BufNewFile", "BufReadPre" },
		dependencies = {
			"williamboman/mason.nvim",
			{
				"stevearc/conform.nvim",
			},
		},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					go = { "gofmt" },
					html = { "prettierd" },
					htmldjango = { "djlint" },
					javascript = { "prettierd" },
					json = { "prettierd", "fixjson" },
					lua = { "stylua" },
					markdown = {
						"prettierd",
						"markdownlint",
						"markdown-toc",
					},
					python = {
						"autoflake",
						"isort",
						"black",
						"auto_optional",
						"docformatter",
					},
					toml = { "taplo" },
					typescript = { "prettierd" },
					xml = { "xmlformatter" },
					yaml = { "prettierd", "yamlfix" },
				},
				format_on_save = {
					timeout_ms = 1500,
					lsp_format = "fallback",
				},
				formatters = {
					black = {
						append_args = {
							"--line-length",
							"79",
						},
					},
					stylua = {
						append_args = {
							"--column-width",
							"79",
						},
					},
				},
			})
			require("mason-conform").setup({})
		end,
	},
	{
		"cappyzawa/trim.nvim",
		opts = {
			trim_on_write = true,
			trim_last_line = false,
		},
	},
}
