return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "RRethy/nvim-treesitter-textsubjects",
        "nvim-treesitter/nvim-treesitter-textobjects",
        "nvim-treesitter/nvim-treesitter-context",
    },
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    init = function(plugin)
        require("lazy.core.loader").add_to_rtp(plugin)
        require("nvim-treesitter.query_predicates")
    end,
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    opts = {
        ensure_installed = { "diff" },
        highlight = { enable = true },
        indent = { enable = true },
        auto_install = true,
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<c-q>",
                node_incremental = "<c-q>",
                scope_incremental = false,
                node_decremental = "<a-q>",
            },
        },
        textobjects = {
            move = {
                enable = true,
                goto_next_start = {
                    ["]f"] = "@function.outer",
                    ["]c"] = "@class.outer",
                    ["]a"] = "@parameter.inner",
                },
                goto_next_end = {
                    ["]F"] = "@function.outer",
                    ["]C"] = "@class.outer",
                    ["]A"] = "@parameter.inner",
                },
                goto_previous_start = {
                    ["[f"] = "@function.outer",
                    ["[c"] = "@class.outer",
                    ["[a"] = "@parameter.inner",
                },
                goto_previous_end = {
                    ["[F"] = "@function.outer",
                    ["[C"] = "@class.outer",
                    ["[A"] = "@parameter.inner",
                },
            },
        },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
        require("treesitter-context").setup()
    end,
}
