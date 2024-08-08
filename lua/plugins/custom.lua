return {
    -- Syntax higlighting
    {
	"nvim-treesitter/nvim-treesitter",
    	build = ":TSUpdate",
    },

    -- Filesystem tree
    {
	"nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {}
        end,
	},

    -- Shows keys shortcuts helper
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      },
    }
}
