-- Task runner
return {
    "stevearc/overseer.nvim",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
        "stevearc/dressing.nvim",
        "nvim-telescope/telescope.nvim",
        "rcarriga/nvim-notify",
    },
    config = function()
        local overseer = require("overseer")

        overseer.setup({
            dap = false,
            templates = {},
        })
    end,
}
