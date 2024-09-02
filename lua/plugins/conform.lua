return {
    "stevearc/conform.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = {
        default_format_opts = {
            lsp_format = "fallback", -- LSP formatting is used when no other formatters are available
        },

        formatters_by_ft = {
            lua = { "stylua" },
            python = { "isort", "black" },
            javascript = { "prettier", "prettierd", stop_after_first = true },
            css = { "prettier" },
            htmldjango = { "djlint" },
        },
    },
}
