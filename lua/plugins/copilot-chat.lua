if vim.g.ai_cmp_engine == "copilot" then
    return {
        {
            "CopilotC-Nvim/CopilotChat.nvim",
            branch = "canary",
            dependencies = {
                { "github/copilot.vim" },
                { "nvim-lua/plenary.nvim" },
            },
            opts = {}
        },
    }
else
    return {}
end
