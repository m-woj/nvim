return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        local lsp = require("lspconfig")

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

        capabilities.textDocument.completion.completionItem.snippetSupport = true -- Capabilities required for the visualstudio lsps (css, html, etc)

        lsp.lua_ls.setup({
            capabilites = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }, -- Get the language server to recognize the `vim` global
                    },
                },
            },
        })

        lsp.ruff_lsp.setup({
            capabilites = capabilities,
            filetypes = { "python" },
        })

        lsp.jinja_lsp.setup({
            capabilites = capabilities,
            filetypes = { "jinja", "htmldjango" },
        })
    end,
}
