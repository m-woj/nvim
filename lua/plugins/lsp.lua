return {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = "BufReadPost",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup()
        local lsp = require("lspconfig")

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

        -- Capabilities required for the visualstudio lsps (css, html, etc)
        capabilities.textDocument.completion.completionItem.snippetSupport = true

        -- After setting up mason-lspconfig you may set up servers via lspconfig
        lsp.lua_ls.setup({
            capabilites = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = { "vim" },
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

        lsp.tsserver.setup({
            capabilites = capabilities,
            filetypes = { "javascript", "typescript" },
        })
    end,
}
