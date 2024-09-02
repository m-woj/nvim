return {
    "stevearc/conform.nvim",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
        "williamboman/mason.nvim",
    },
    opts = {
        default_format_opts = {
            -- LSP formatting is used when no other formatters are available
            lsp_format = "fallback",
        },

        formatters_by_ft = {
            lua = { "stylua" },
            python = { "isort", "black" },
            javascript = { "prettier" },
            css = { "prettier" },
            html = { "prettier" },
            htmldjango = { "djlint" },
        },
    },
}
