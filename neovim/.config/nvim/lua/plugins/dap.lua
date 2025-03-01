return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",
      "leoluz/nvim-dap-go",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      local keymap = vim.keymap.set

      require("mason-nvim-dap").setup({
        ensure_installed = {
          "delve",
          "php",
        },
      })

      dapui.setup({
        controls = {
          enabled = false,
        },
      })

      dap.adapters.php = {
        type = "executable",
        command = "php-debug-adapter",
      }

      dap.configurations.php = {
        {
          type = "php",
          request = "launch",
          name = "Listen for Xdebug",
          port = 9003,
        },
      }

      keymap("n", "<leader>b", dap.toggle_breakpoint)
      keymap("n", "<leader>B", function()
        dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end)
      keymap("n", "<leader>gb", dap.run_to_cursor)

      keymap("n", "<leader>?", function()
        dapui.eval(nil, { enter = true })
      end)

      keymap("n", "<F5>", dap.continue)
      keymap("n", "<F6>", dap.step_over)
      keymap("n", "<F7>", dap.step_into)
      keymap("n", "<F8>", dap.step_out)
      keymap("n", "<leader><F5>", dap.restart)

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      require("dap-go").setup()
    end,
  },
}
