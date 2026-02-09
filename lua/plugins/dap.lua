return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      { "rcarriga/nvim-dap-ui" },
      { "nvim-neotest/nvim-nio" },
      { "jay-babu/mason-nvim-dap.nvim" },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- ------------------------------------------------------------
      -- Mason DAP setup
      -- ------------------------------------------------------------
      require("mason-nvim-dap").setup({
        automatic_installation = true,
      })

      -- ------------------------------------------------------------
      -- DAP UI setup
      -- ------------------------------------------------------------
      dapui.setup()

      -- Automatically open/close DAP UI when debugging starts/stops
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- ------------------------------------------------------------
      -- Keybindings
      -- ------------------------------------------------------------
      vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end, { desc = "Toggle breakpoint" })
      vim.keymap.set("n", "<leader>dB", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, { desc = "Set conditional breakpoint" })
      vim.keymap.set("n", "<leader>dc", function() dap.continue() end, { desc = "Continue" })
      vim.keymap.set("n", "<leader>di", function() dap.step_into() end, { desc = "Step into" })
      vim.keymap.set("n", "<leader>do", function() dap.step_over() end, { desc = "Step over" })
      vim.keymap.set("n", "<leader>dO", function() dap.step_out() end, { desc = "Step out" })
      vim.keymap.set("n", "<leader>dr", function() dap.repl.toggle() end, { desc = "Toggle REPL" })
      vim.keymap.set("n", "<leader>du", function() dapui.toggle() end, { desc = "Toggle DAP UI" })
    end,
  },
}
