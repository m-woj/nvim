-- Code completion
return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",

        "windwp/nvim-autopairs",
        "onsails/lspkind-nvim",
        { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    },

    config = function()
        local cmp = require("cmp")
        local lsp_kind = require("lspkind")
        lsp_kind.init()
        cmp.setup({
            preselect = cmp.PreselectMode.Item, -- works after pressing <CR>
            snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                    vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp_signature_help", group_index = 2 },
                { name = "nvim_lsp", max_item_count = 20, group_index = 2 },
                { name = "path", group_index = 2 },
                { name = "buffer", group_index = 2 },
            }),
        })

        local presentAutopairs, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
        if not presentAutopairs then
            return
        end
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline" },
            }),
            matching = { disallow_symbol_nonprefix_matching = false },
        })
    end,
}
