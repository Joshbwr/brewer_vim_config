return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			vim.keymap.set("n", "<leader>bs", require("dap").continue)
			vim.keymap.set("n", "<leader>bo", require("dap").step_over)
			vim.keymap.set("n", "<leader>b", require("dap").toggle_breakpoint)
			vim.keymap.set("n", "<leader>B", function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end)
			vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
			vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "", linehl = "", numhl = "" })
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
		},

		config = function()
			require("dapui").setup({

				layouts = {
					{
						elements = {
							{ id = "scopes", size = 0.50 },
							{ id = "breakpoints", size = 0.50 },
						},
						size = 0.2,
						position = "bottom",
					},
				},
			})
			local dap, dapui = require("dap"), require("dapui")

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open({})
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close({})
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close({})
			end

			vim.keymap.set("n", "<leader>ui", require("dapui").toggle)
		end,
	},
}
