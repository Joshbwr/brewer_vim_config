return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "jay-babu/mason-nvim-dap.nvim",
      "mfussenegger/nvim-dap",
      "mxsdev/nvim-dap-vscode-js",
      "williamboman/mason.nvim",
      "leoluz/nvim-dap-go",
    },
    config = function()
      local mason_dap = require("mason-nvim-dap")
      local dap = require("dap")
      local ui = require("dapui")

      dap.set_log_level("TRACE")
      mason_dap.setup({
        ensure_installed = { "delve" },
        automatic_installation = true,
      })

      dap.configurations = {
        go = {
          {
            type = "go", -- Which adapter to use
            name = "Debug", -- Human readable name
            request = "launch", -- Whether to "launch" or "attach" to program
            program = "${file}", -- The buffer you are focused on when running nvim-dap
          },
        },
      }

      dap.adapters.go = {
        type = "server",
        port = "${port}",
        executable = {
          command = vim.fn.stdpath("data") .. "/mason/bin/dlv",
          args = { "dap", "-l", "127.0.0.1:${port}" },
        },
      }

      vim.fn.sign_define("DapBreakpoint", { text = "🐞" })

      local function dap_start_debugging()
        dap.continue({})
        vim.cmd("tabedit %")
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-o>", false, true, true), "n", false)
        ui.toggle({})
      end

      vim.keymap.set("n", "<leader>ds", dap_start_debugging)
      vim.keymap.set("n", "<leader>dl", require("dap.ui.widgets").hover)
      vim.keymap.set("n", "<leader>dc", dap.continue)
      vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
      vim.keymap.set("n", "<leader>dn", dap.step_over)
      vim.keymap.set("n", "<leader>di", dap.step_into)
      vim.keymap.set("n", "<leader>do", dap.step_out)

      local function dap_clear_breakpoints()
        dap.clear_breakpoints()
        --require("notify")("Breakpoints cleared", "warn")
      end

      vim.keymap.set("n", "<leader>dC", dap_clear_breakpoints)
      vim.keymap.set("n", "<leader>dr", function()
        require("dap").run_last()
      end)

      local function dap_end_debug()
        dap.clear_breakpoints()
        ui.toggle({})
        dap.terminate({}, { terminateDebuggee = true }, function()
          vim.cmd.bd()
          --u.resize_vertical_splits()
          -- require("notify")("Debugger session ended", "warn")
        end)
      end

      vim.keymap.set("n", "<leader>de", dap_end_debug)

      -- UI Settings
      ui.setup({
        icons = { expanded = "▾", collapsed = "▸" },
        mappings = {
          expand = { "<CR>", "<2-LeftMouse>" },
          open = "o",
          remove = "d",
          edit = "e",
          repl = "r",
          toggle = "t",
        },
        layouts = {
          {
            elements = {
              "scopes",
            },
            size = 0.3,
            position = "right",
          },
          {
            elements = {
              "repl",
              "breakpoints",
            },
            size = 0.3,
            position = "bottom",
          },
        },
        floating = {
          -- max_height = nil,
          -- max_width = nil,
          border = "single",
          mappings = {
            close = { "q", "<Esc>" },
          },
        },
        windows = { indent = 1 },
        render = {
          max_type_length = nil,
        },
      })
    end,
  },
}
