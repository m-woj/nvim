return {
    "linux-cultist/venv-selector.nvim",
    lazy = true,
    ft = "python",
    dependencies = {
        "neovim/nvim-lspconfig",
        "nvim-telescope/telescope.nvim",
        "mfussenegger/nvim-dap-python",
    },
    branch = "regexp", -- This is the regexp branch, use this for the new version
    opts = {
        settings = {
            options = {
                require_lsp_activation = false,
            },
        },
    },
}
