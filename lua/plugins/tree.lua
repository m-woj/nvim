return {
    "nvim-tree/nvim-tree.lua",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({
            sort = {
                sorter = "case_sensitive",
            },
            view = {
                width = 30,
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = true,
            },
            diagnostics = {
                enable = true,
                show_on_dirs = true,
                severity = {
                    min = vim.diagnostic.severity.ERROR,
                },
            },
        })
    end,
}
