return {
    "mfussenegger/nvim-dap",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
        "stevearc/overseer.nvim",
        "mfussenegger/nvim-dap-python",
    },
    config = function()
        local python_debugpy_path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
        require("dap-python").setup(python_debugpy_path)
        require("overseer").enable_dap()
    end,
}
