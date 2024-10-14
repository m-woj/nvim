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
        vim.cmd("highlight Red guifg=#FF0000")

        vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "Red", numhl = "" })
        vim.fn.sign_define("DapBreakpointCondition", { text = "🔵", texthl = "", linehl = "", numhl = "" })
        vim.fn.sign_define("DapLogPoint", { text = "📍", texthl = "", linehl = "", numhl = "" })
        vim.fn.sign_define("DapStopped", { text = "➡️", texthl = "", linehl = "", numhl = "" })
        vim.fn.sign_define("DapBreakpointRejected", { text = "❌", texthl = "", linehl = "", numhl = "" })

        local python_debugpy_path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
        require("dap-python").setup(python_debugpy_path)
        require("overseer").enable_dap()

        local dapui = require("dapui")
        dapui.setup()
        vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Toggle DAP UI" })
    end,
}
