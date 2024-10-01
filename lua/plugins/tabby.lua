return {
    "nanozuki/tabby.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        require("tabby").setup({
            preset = "active_wins_at_tail",
        })
    end,
}
