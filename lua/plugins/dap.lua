--[[ return {
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
            "mfussenegger/nvim-dap-python",
        },
    },
    config = function()
        require("dap-python").setup("python")
    end,
} ]]

return {
    "mfussenegger/nvim-dap",
    "mfussenegger/nvim-dap-python",
    config = function()
        require("dap-python").setup("python")
    end,
}
