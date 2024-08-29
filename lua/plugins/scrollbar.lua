return {
    "petertriho/nvim-scrollbar",
    config = function()
        local colors = require("tokyonight.colors").setup()

        require("scrollbar").setup({
            hide_if_all_visible = true, -- Hides everything if all lines are visible
            handle = {
                blend = 10, -- Integer between 0 and 100. 0 for fully opaque and 100 to full transparent.
                color = colors.bg_highlight,
            },
            marks = {
                Search = { color = colors.orange },
                Error = { color = colors.error },
                Warn = { color = colors.warning },
                Info = { color = colors.info },
                Hint = { color = colors.hint },
                Misc = { color = colors.purple },
            },
        })
    end,
}
