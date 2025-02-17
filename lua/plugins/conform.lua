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
            python = { "ruff_fix", "ruff_organize_imports", "ruff_format" },
            javascript = { "prettier" },
            typescript = { "prettier" },
            css = { "prettier" },
            scss = { "prettier" },
            html = { "prettier" },
            htmldjango = { "prettier" },
        },
    },
}
