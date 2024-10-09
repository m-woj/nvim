return {
    "nvim-neotest/neotest",
    veryLazy = true,
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-neotest/neotest-python",
        "nvim-neotest/neotest-plenary",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-python"),
                require("neotest-plenary"),
            },
        })
    end,
}
