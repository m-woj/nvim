return {
    "nvim-neotest/neotest",
    event = "VeryLazy",
    lazy = true,
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-neotest/neotest-python",
        "nvim-neotest/neotest-plenary",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        local neotest = require("neotest")
        local prefix = "<leader>e"
        neotest.setup({
            adapters = {
                require("neotest-python"),
                require("neotest-plenary"),
            },
            discovery = {
                filter_dir = function(name, rel_path, root)
                    return not name:match("^%.?venv")
                end,
            },
        })

        vim.keymap.set("n", prefix .. "R", function()
            neotest.run.run(vim.fn.expand("%"))
        end, { desc = "Run tests in current file" })
        vim.keymap.set("n", prefix .. "r", function()
            neotest.run.run()
        end, { desc = "Run closest test" })
        vim.keymap.set("n", prefix .. "w", function()
            neotest.summary.toggle()
        end, { desc = "Toggle tests summary window" })
    end,
}
