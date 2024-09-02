return {
    "github/copilot.vim",
    enabled = function()
        return vim.g.ai_cmp_engine == "copilot"
    end,
}
