return {
    "stevearc/conform.nvim",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
        "williamboman/mason.nvim",
    },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "isort", "black" },
            javascript = { "prettier" },
            css = { "prettier" },
            scss = { "prettier" },
            html = { "prettier" },
            htmldjango = { "djlint" },
        },
    },
}
