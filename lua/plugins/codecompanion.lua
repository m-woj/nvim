return {
    "olimorris/codecompanion.nvim",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "hrsh7th/nvim-cmp", -- Optional: For activating slash commands and variables in the chat buffer
        "nvim-telescope/telescope.nvim", -- Optional: For working with files with slash commands
        {
            "stevearc/dressing.nvim", -- Optional: Improves the default Neovim UI
            opts = {},
        },
    },
    enabled = function()
        return vim.g.ai_chat == "ollama"
    end,
    config = function()
        require("codecompanion").setup({
            strategies = {
                chat = {
                    adapter = "ollama",
                },
                inline = {
                    adapter = "ollama",
                },
                agent = {
                    adapter = "ollama",
                },
            },
            adapters = {
                ollama = function()
                    return require("codecompanion.adapters").extend("ollama", {
                        parameters = {
                            sync = true,
                        },
                        schema = {
                            model = {
                                default = "mistral-nemo",
                            },
                        },
                    })
                end,
            },
        })
    end,
}
