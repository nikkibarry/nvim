return {
	{
		"chrisgrieser/nvim-scissors",
		event = { "BufNewFile", "BufReadPre" },
		dependencies = { "nvim-telescope/telescope.nvim" },
		opts = {
			snippetDir = vim.fn.stdpath("config") .. "/snippets",
		},
	},
	{
		"rafamadriz/friendly-snippets",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = "rafamadriz/friendly-snippets",
		build = "make install_jsregexp",
		opts = {
			history = true,
			updateevents = "TextChanged,TextChangedI",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{ "petertriho/cmp-git", opts = {} },
			"L3MON4D3/LuaSnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"petertriho/cmp-git",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-calc",
			{
				"vrslev/cmp-pypi",
				ft = "toml",
			},
			"ray-x/cmp-treesitter",
			"lukas-reineke/cmp-under-comparator",
			"onsails/lspkind.nvim",
			{
				"Saecki/crates.nvim",
				event = { "BufRead Cargo.toml" },
				opts = {
					completion = {
						cmp = { enabled = true },
					},
				},
			},
			"windwp/nvim-autopairs",
			"VonHeikemen/lsp-zero.nvim",
		},
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
			require("luasnip.loaders.from_vscode").lazy_load({
				paths = vim.fn.stdpath("config") .. "/snippets",
			})

			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local lspkind = require("lspkind")

			local lsp_zero = require("lsp-zero")
			lsp_zero.extend_cmp()

			local cmp = require("cmp")
			local cmp_action = lsp_zero.cmp_action()

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<Tab>"] = cmp_action.luasnip_supertab(),
					["<S-Tab"] = cmp_action.luasnip_shift_supertab(),
					["<C-y>"] = cmp.mapping.confirm({ select = false }),
				}),
				sources = {
					{ name = "luasnip" },
					{ name = "nvim_lsp" },
					{ name = "treesitter" },
					{ name = "path" },
					{ name = "buffer" },
					{ name = "calc" },
					{ name = "pypi" },
					{ name = "git" },
					{ name = "crates" },
				},
				sorting = {
					comparators = {
						cmp.config.compare.offset,
						cmp.config.compare.exact,
						cmp.config.compare.score,
						require("cmp-under-comparator").under,
						cmp.config.compare.kind,
						cmp.config.compare.sort_text,
						cmp.config.compare.length,
						cmp.config.compare.order,
					},
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol",
						maxwidth = 50,
						ellipsis_char = "...",
						show_labelDetails = true,
					}),
				},
			})
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
}
