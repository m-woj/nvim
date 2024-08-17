return {
    "stevearc/conform.nvim",
    opts = {
        default_format_opts = {
            lsp_format = "fallback", -- LSP formatting is used when no other formatters are available
        },
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "isort", "black" }, -- run each sequentially
            javascript = { "prettier", "prettierd", stop_after_first = true },
            css = { "prettier" },
            htmldjango = { "djlint" },
        },
    },
}
