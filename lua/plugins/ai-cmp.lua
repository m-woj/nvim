if vim.g.ai_cmp_engine == "codeium" then
    return {
        "Exafunction/codeium.vim",
        event = "BufEnter",
    }
elseif vim.g.ai_cmp_engine == "copilot" then
    return {
        "github/copilot.vim",
    }
else
    return {}
end
