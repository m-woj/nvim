return {
    "rmagatti/auto-session",
    lazy = false,
    dependencies = {
        "nvim-telescope/telescope.nvim", -- Only needed if you want to use sesssion lens
        -- "tiagovla/scope.nvim",
    },
    opts = {
        auto_session_use_git_branch = true,
    },
    config = function()
        require("auto-session").setup({
            close_unsupported_windows = true, -- boolean: Close windows that aren't backed by normal file
            silent_restore = true, -- Suppress extraneous messages and source the whole session, even if there's an error. Set to false to get the line number a restore error

            -- Currently not working

            -- post_save_cmds = {
            --     function()
            --         return [[ScopeSaveState]]
            --     end,
            -- },
            -- post_restore_cmds = {
            --     function()
            --         return [[ScopeLoadState]]
            --     end,
            -- }
        })
    end,
}
