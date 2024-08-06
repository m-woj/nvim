return {
    -- Telescope, file search, grep search
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
          dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- Session management
    {
        'rmagatti/auto-session',
        lazy = false,
        dependencies = {
        'nvim-telescope/telescope.nvim', -- Only needed if you want to use sesssion lens
        },
        config = function()
        require('auto-session').setup({
          auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
            })
        end,
    },

    -- Git integration
    {
      "NeogitOrg/neogit",
          dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "sindrets/diffview.nvim",        -- optional - Diff integration
            "nvim-telescope/telescope.nvim", -- optional
          },
          config = true
    }

}
