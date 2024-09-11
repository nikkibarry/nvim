return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v4.x",
		lazy = true,
		config = false,
	},
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = true,
	},
	{
		"b0o/SchemaStore.nvim",
		lazy = true,
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async",
		},
		config = function()
			vim.o.foldcolumn = "1"
			vim.o.foldlevel = 99
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true
			local ufo = require("ufo")
			ufo.setup({
				open_fold_hl_timeout = 150,
				close_fold_kinds_for_ft = {
					default = { "imports", "comment" },
				},
			})
			vim.keymap.set("n", "zR", ufo.openAllFolds)
			vim.keymap.set("n", "zM", ufo.closeAllFolds)
			vim.keymap.set("n", "zr", ufo.openFoldsExceptKinds)
		end,
	},
	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "ray-x/lsp_signature.nvim" },
			{
				"Wansmer/symbol-usage.nvim",
				config = function()
					require("symbol-usage").setup({})
				end,
			},
			{
				"lvimuser/lsp-inlayhints.nvim",
			},
		},
		config = function()
			local lsp_signature = require("lsp_signature")
			lsp_signature.setup()

			local lsp_inlayhints = require("lsp-inlayhints")
			lsp_inlayhints.setup()

			local lsp_zero = require("lsp-zero")

			local lsp_attach = function(client, bufnr)
				lsp_zero.default_keymaps({
					buffer = bufnr,
				})
				lsp_signature.on_attach({
					bind = true,
					floating_window = false,
				}, bufnr)
				lsp_inlayhints.on_attach(client, bufnr)
			end

			local lsp_capabilities = vim.tbl_deep_extend(
				"force",
				require("cmp_nvim_lsp").default_capabilities(),
				{
					textDocument = {
						foldingRange = {
							dynamicRegistration = false,
							lineFoldingOnly = true,
						},
					},
				}
			)

			lsp_zero.extend_lspconfig({
				capabilities = lsp_capabilities,
				lsp_attach = lsp_attach,
				float_border = "rounded",
				sign_text = {
					error = "✘",
					warn = "▲",
					hint = "⚑",
					info = "»",
				},
			})

			local schemastore = require("schemastore")
			local lspconfig = require("lspconfig")

			require("mason-lspconfig").setup({
				ensure_installed = {
					"basedpyright",
					"cssls",
					"docker_compose_language_service",
					"dockerls",
					"eslint",
					"gopls",
					"html",
					"jsonls",
					"lua_ls",
					"marksman",
					"taplo",
					"ts_ls",
					"typos_lsp",
					"yamlls",
				},
				handlers = {
					function(server_name)
						lspconfig[server_name].setup({})
					end,
					jsonls = function()
						lspconfig.jsonls.setup({
							settings = {
								json = {
									schemas = schemastore.json.schemas(),
									validate = {
										enable = true,
									},
								},
							},
						})
					end,
					yamlls = function()
						lspconfig.yamlls.setup({
							settings = {
								yaml = {
									schemaStore = {
										enable = false,
										url = "",
									},
									schemas = schemastore.yaml.schemas(),
								},
							},
						})
					end,
					basedpyright = function()
						lspconfig.basedpyright.setup({
							settings = {
								basedpyright = {
									analysis = {
										-- use mypy instead
										autoImportCompletions = true,
										autoSearchPaths = true,
										useLibraryCodeForTypes = true,
										venvPath = "~/.local/share/virtualenvs/",
									},
								},
							},
						})
					end,
					lua_ls = function()
						lspconfig.lua_ls.setup({
							settings = {
								Lua = {
									hint = {
										enable = true,
									},
								},
							},
						})
					end,
				},
			})
		end,
	},
	{
		"j-hui/fidget.nvim",
		config = true,
	},
	{
		"rmagatti/goto-preview",
		event = "BufEnter",
		config = true,
		keys = {
			{
				"gpd",
				function()
					require("goto-preview").goto_preview_definition()
				end,
				desc = "Preview definition",
			},
			{
				"gpD",
				function()
					require("goto-preview").goto_preview_declaration()
				end,
				desc = "Preview declaration",
			},
		},
	},
}
