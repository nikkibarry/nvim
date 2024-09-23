return {
	{
		"mfussenegger/nvim-dap",
		event = { "BufNewFile", "BufReadPre" },
		dependencies = {
			{
				"rcarriga/nvim-dap-ui",
				dependencies = {
					"nvim-neotest/nvim-nio",
				},
			},
			{
				"theHamsta/nvim-dap-virtual-text",
				config = function()
					require("nvim-dap-virtual-text").setup({
						commented = true,
					})
				end,
			},
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()

			dap.listeners.before.attach["dapui_config"] = function()
				dapui.open({})
			end
		end,
		keys = {
			{
				"<leader>d",
				"",
				desc = "Debugging",
			},
			{
				"<leader>dr",
				"",
				desc = "Run",
			},
			{
				"<leader>du",
				function()
					require("dapui").toggle({})
				end,
				desc = "DAP UI",
			},
			{
				"<leader>dc",
				"<cmd>DapContinue<cr>",
				desc = "DAP continue",
			},
		},
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = { "BufNewFile", "BufReadPre" },
		dependencies = "mason.nvim",
		config = function()
			require("mason-nvim-dap").setup({
				ensure_installed = {
					"codelldb",
					"delve",
					"python",
				},
				automatic_installation = {
					exclude = {
						"python",
					},
				},
			})
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
		ft = { "python" },
		config = function()
			local debugPythonPath =
				"~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(debugPythonPath)
		end,
		keys = {
			{
				"<leader>dp",
				desc = "Debug python",
				ft = "python",
			},
			{
				"<leader>dpt",
				function()
					require("dap-python").test_method()
				end,
				desc = "Debug Method",
				ft = "python",
			},
			{
				"<leader>dpc",
				function()
					require("dap-python").test_class()
				end,
				desc = "Debug class",
				ft = "python",
			},
		},
	},
	{
		"leoluz/nvim-dap-go",
		config = function()
			require("dap-go").setup()
		end,
	},
	{
		"nvim-neotest/neotest",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-python",
			"nvim-neotest/neotest-go",
			"lawrence-laz/neotest-zig",
			"alfaix/neotest-gtest",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-python")({
						runner = "pytest",
						pytest_discover_instances = true,
					}),
					require("neotest-go"),
					require("neotest-zig")({
						dap = {
							adapter = "lldb",
						},
					}),
					require("neotest-gtest").setup({}),
				},
			})
		end,
		keys = {
			{
				"<leader>drt",
				function()
					require("neotest").run.run()
				end,
				desc = "Run test method",
			},
			{
				"<leader>drf",
				function()
					require("neotest").run.run((vim.fn.expand("%")))
				end,
				desc = "Run test file",
			},
			{
				"<leader>drT",
				function()
					require("neotest").run.run({ strategy = "dap" })
				end,
				desc = "Debug test method",
			},
			{
				"<leader>drF",
				function()
					require("neotest").run.run({
						vim.fn.expand("%"),
						strategy = "dap",
					})
				end,
				desc = "Debug test file",
			},
		},
	},
	{
		"andythigpen/nvim-coverage",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("coverage").setup()
		end,
	},
	{
		"Weissle/persistent-breakpoints.nvim",
		config = function()
			require("persistent-breakpoints").setup({
				load_breakpoints_event = { "BufReadPost" },
				save_dir = vim.fn.stdpath("data") .. "/nvim_checkpoints",
			})
		end,
		keys = {
			{
				"<leader>db",
				function()
					require("persistent-breakpoints.api").toggle_breakpoint()
				end,
				desc = "Toggle Breakpoint",
			},
		},
	},
}
