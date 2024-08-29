return {
    "harrisoncramer/gitlab.nvim",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
        "nvim-tree/nvim-web-devicons", -- Recommended but not required. Icons in discussion tree.
    },
    enabled = function()
        if vim.g.gitlab_token then
            return true
        else
            return false
        end
    end,
    build = function()
        require("gitlab.server").build(true)
    end, -- Builds the Go binary
    config = function()
        local function is_insecure()
            return vim.g.gitlab_insecure or false
        end
        require("gitlab").setup({
            auth_provider = function()
                return vim.g.gitlab_token, vim.g.gitlab_url, nil
            end,
            reviewer = "diffview",
            connection_settings = {
                insecure = is_insecure(),
            },
        })
    end,
}
