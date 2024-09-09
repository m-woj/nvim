return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        lazy = true,
        event = "VeryLazy",
        branch = "canary",
        dependencies = {
            { "github/copilot.vim" },
            { "nvim-lua/plenary.nvim" },
        },
        enabled = function()
            return vim.g.ai_cmp_engine == "copilot" and vim.g.ai_chat == "copilot"
        end,
        opts = {},
    },
}
