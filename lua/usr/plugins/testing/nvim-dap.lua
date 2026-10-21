return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      require("mason-nvim-dap").setup({
        automatic_setup = true,
      })

      local debugpy_python = vim.fn.expand("~/.local/share/nvim/py-tools/bin/python")
      if vim.fn.executable(debugpy_python) == 1 then
        dap.adapters.python = {
          type = "executable",
          command = debugpy_python,
          args = { "-m", "debugpy.adapter" },
        }
        dap.configurations.python = {
          {
            type = "python",
            request = "launch",
            name = "Lanzar archivo actual",
            program = "${file}",
            pythonPath = function()
              return debugpy_python
            end,
          },
        }
      end
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
}
