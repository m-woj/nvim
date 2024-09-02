return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "canary",
        dependencies = {
            { "github/copilot.vim" },
            { "nvim-lua/plenary.nvim" },
        },
        enabled = function()
            return vim.g.ai_cmp_engine == "copilot"
        end,
        opts = {},
    },
}
