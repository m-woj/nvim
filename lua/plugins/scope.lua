-- This plugin revolutionizes tab management by introducing scoped buffers.
return {
    "tiagovla/scope.nvim",
    config = function()
        require("scope").setup({})
    end,
}
