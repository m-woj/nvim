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

        local lspconfig = require("lspconfig")
        for server, config in pairs(opts.servers) do
            -- passing config.capabilities to blink.cmp merges with the capabilities in your
            -- `opts[server].capabilities, if you've defined it
            config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
            lspconfig[server].setup(config)
        end
    end,
}
