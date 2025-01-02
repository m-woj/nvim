return {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = "BufReadPost",
    dependencies = {
        "saghen/blink.cmp",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    opts = {
        servers = {
            lua_ls = {},
        },
    },
    config = function(_, opts)
        require("mason").setup()
        require("mason-lspconfig").setup()

        local lsp = require("lspconfig")

        -- After setting up mason-lspconfig you may set up servers via lspconfig
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

        lsp.pylsp.setup({
            filetypes = { "python" },
        })

        lsp.jinja_lsp.setup({
            filetypes = { "jinja", "htmldjango" },
        })

        lsp.ts_ls.setup({
            filetypes = { "javascript", "typescript" },
        })

        lsp.cssls.setup({
            filetypes = { "css", "scss", "less" },
        })

        lsp.css_variables.setup({
            filetypes = { "css", "scss", "less" },
        })

        lsp.jsonls.setup({
            filetypes = { "json" },
        })
        for server, config in pairs(opts.servers) do
            -- passing config.capabilities to blink.cmp merges with the capabilities in your
            -- `opts[server].capabilities, if you've defined it
            config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
            lsp[server].setup(config)
        end
    end,
}
