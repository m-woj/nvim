-- LSP, formatters, DAP orchestrator

return {
    "williamboman/mason.nvim",
    dependencies = {
        "jay-babu/mason-nvim-dap.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup()
        require("mason-nvim-dap").setup()

        local lsp = require("lspconfig")
        require("mason-lspconfig").setup({
            automatic_installation = true,
            handlers = {
                function(server_name)
                    lsp[server_name].setup({})
                end,
            },
        })
    end,
}
