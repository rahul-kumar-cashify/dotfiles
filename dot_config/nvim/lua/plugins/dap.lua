return {
	{
		"mfussenegger/nvim-dap",
		-- IntelliJ-style debug keybindings
		keys = {
			{ "<F9>", function() require("dap").continue() end, desc = "Resume / Continue" },
			{ "<S-F9>", function() require("dap").continue() end, desc = "Run / Debug" },
			{ "<F8>", function() require("dap").step_over() end, desc = "Step over" },
			{ "<F7>", function() require("dap").step_into() end, desc = "Step into" },
			{ "<S-F8>", function() require("dap").step_out() end, desc = "Step out" },
			{ "<C-F8>", function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint" },
			{ "<A-F8>", function() require("dap").repl.open() end, desc = "Evaluate expression (REPL)" },
			{ "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Condition: ")) end, desc = "Conditional breakpoint" },
			{ "<leader>dc", function() require("dap").run_to_cursor() end, desc = "Run to cursor" },
			{ "<leader>dr", function() require("dap").repl.open() end, desc = "Open REPL" },
			{ "<leader>dl", function() require("dap").run_last() end, desc = "Run last" },
			{ "<leader>du", function() require("dapui").toggle() end, desc = "DAP UI toggle" },
		},
		dependencies = {
			{ "rcarriga/nvim-dap-ui", opts = { floating = { border = "rounded" } } },
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
			dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
			dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
			local python = os.getenv("VIRTUAL_ENV") and (os.getenv("VIRTUAL_ENV") .. "/bin/python") or "python3"
			dap.adapters.python = {
				type = "executable",
				command = python,
				args = { "-m", "debugpy.adapter" },
			}
			dap.configurations.python = {
				{
					type = "python",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					pythonPath = function()
						return os.getenv("VIRTUAL_ENV") and (os.getenv("VIRTUAL_ENV") .. "/bin/python") or "python3"
					end,
				},
				{
					type = "python",
					request = "launch",
					name = "Launch file with args",
					program = "${file}",
					args = function()
						local input = vim.fn.input("Args: ")
						return vim.split(vim.fn.empty(input) == 1 and "" or input, " ")
					end,
					pythonPath = function()
						return os.getenv("VIRTUAL_ENV") and (os.getenv("VIRTUAL_ENV") .. "/bin/python") or "python3"
					end,
				},
				{
					type = "python",
					request = "attach",
					name = "Attach remote",
					connect = function()
						local host = vim.fn.input("Host [127.0.0.1]: ") or "127.0.0.1"
						local port = tonumber(vim.fn.input("Port [5678]: ")) or 5678
						return { host = host, port = port }
					end,
				},
			}
		end,
	},
}
