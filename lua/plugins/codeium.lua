return {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    enabled = function()
        return vim.g.ai_cmp_engine == "codeium"
    end,
}
