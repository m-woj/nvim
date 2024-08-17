return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        local lsp = require("lspconfig")

        require("mason-lspconfig").setup({
            automatic_installation = true,
            handlers = {
                function(server_name)
                    lsp[server_name].setup({})
                end,
            },
        })

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

        lsp.lua_ls.setup({
            settings = {
                Lua = {
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = { "vim" },
                    },
                },
            },
        })

        lsp.jinja_lsp.setup({
            filetypes = { "jinja", "htmldjango" },
        })

        lsp.html.setup({
            filetypes = { "htmldjango" },
        })
    end,
}
