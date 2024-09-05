return {
    "ludovicchabant/vim-gutentags",
    lazy = true,
    event = "VeryLazy",
    config = function()
        vim.g.gutentags_ctags_tagfile = ".nvim/tags"
        vim.g.gutentags_exclude_filetypes = { "json" }
        vim.g.gutentags_ctags_exclude = { ".git", "node_modules", ".mypy_cache" }
    end,
}
