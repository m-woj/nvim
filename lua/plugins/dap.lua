return {
    "mfussenegger/nvim-dap",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
        "stevearc/overseer.nvim",
        "mfussenegger/nvim-dap-python",

        -- UI
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
    },
    config = function()
        local python_debugpy_path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
        require("dap-python").setup(python_debugpy_path)
        require("overseer").enable_dap()

        require("dapui").setup()
        local dap, dapui = require("dap"), require("dapui")
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
    end,
}
