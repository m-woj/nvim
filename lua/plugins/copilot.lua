--[[ return {
    "zbirenbaum/copilot-cmp",
    dependencies = {
        {
            "hrsh7th/nvim-cmp",
            "zbirenbaum/copilot.lua",
            cmd = "Copilot",
            event = "InsertEnter",
        },
    },
    config = function()
        require("copilot").setup({
            suggestion = { enabled = false },
            panel = { enabled = true },
            filetypes = {
                markdown = true,
                help = true,
            },
        })

        local copilot_cmp = require("copilot_cmp")
        copilot_cmp.setup({
            event = { "InsertEnter", "LspAttach" },
            fix_pairs = true,
        })

        local cmp = require("cmp")
        local config = cmp.get_config()
        table.insert(config.sources, 1, {
            name = "copilot",
            option = {
                group_index = 2,
            },
        })
        cmp.setup(config)
    end,
} ]]

-- The more specified version above is not working properly, so there is a fallback to the original version below.
return {
    "github/copilot.vim",
}
