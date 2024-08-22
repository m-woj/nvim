return {
    "rmagatti/auto-session",
    lazy = false,
    dependencies = {
        "nvim-telescope/telescope.nvim", -- Only needed if you want to use sesssion lens
        "tiagovla/scope.nvim",
    },
    config = function()
        require("auto-session").setup({
            close_unsupported_windows = true, -- boolean: Close windows that aren't backed by normal file
            silent_restore = true, -- Suppress extraneous messages and source the whole session, even if there's an error. Set to false to get the line number a restore error
            --[[ pre_save_cmds = {
                function()
                    vim.g.Scope = require("scope.session").serialize_state()
                end,
            },
            post_restore_cmds = {
                function()
                    if vim.g.Scope ~= nil then
                        require("scope.session").deserialize_state(vim.g.Scope)
                    end
                end,
            }, ]]
        })
    end,
}
