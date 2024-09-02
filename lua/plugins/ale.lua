return {
    "dense-analysis/ale",
    event = "VeryLazy",
    config = function()
        local g = vim.g

        g.ale_ruby_rubocop_auto_correct_all = 1

        g.ale_linters = {
            lua = { "lua_language_server" },
            python = { "mypy" },
            html = { "htmlhint" },
            htmldjango = { "djlint" },
            css = { "stylelint" },
        }
    end,
}
