return {
    "smjonas/inc-rename.nvim",
    lazy = true,
    event = "VeryLazy",
    config = function()
        require("inc_rename").setup({})
    end,
}
