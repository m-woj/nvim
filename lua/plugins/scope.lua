-- This plugin revolutionizes tab management by introducing scoped buffers.
return {
    "tiagovla/scope.nvim",
    config = function()
        require("telescope").load_extension("scope")
        require("scope").setup({})
    end,
}
