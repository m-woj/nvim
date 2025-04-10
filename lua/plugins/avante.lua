return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    enabled = function()
        return vim.g.avante_provider ~= nil and vim.g.avante_provider ~= ""
    end,
    opts = {
        provider = vim.g.avante_provider,
        copilot = {
            max_tokens = 16000,
            disable_tools = true, -- disable tools!
        },

        claude = {
            max_tokens = 4096,
            disable_tools = true, -- disable tools!
        },

        --- @class AvanteRepoMapConfig
        repo_map = {
            ignore_patterns = { "%.git", "%.worktree", "__pycache__", "node_modules", ".venv*", "venv*" }, -- ignore files matching these
            negate_patterns = {}, -- negate ignore files matching these.
        },

        windows = {
            ---@type "right" | "left" | "top" | "bottom"
            position = "right", -- the position of the sidebar
            wrap = true, -- similar to vim.o.wrap
            width = 45, -- default % based on available width
            sidebar_header = {
                enabled = true, -- true, false to enable/disable the header
                align = "center", -- left, center, right for title
                rounded = true,
            },
            input = {
                prefix = "> ",
                height = 8, -- Height of the input window in vertical layout
            },
            edit = {
                border = "rounded",
                start_insert = true, -- Start insert mode when opening the edit window
            },
            ask = {
                floating = false, -- Open the 'AvanteAsk' prompt in a floating window
                start_insert = true, -- Start insert mode when opening the ask window
                border = "rounded",
                ---@type "ours" | "theirs"
                focus_on_apply = "ours", -- which diff to focus after applying
            },
        },

        mappings = {
            ---@class AvanteConflictMappings
            diff = {
                ours = "co",
                theirs = "ct",
                all_theirs = "ca",
                both = "cb",
                cursor = "cc",
                next = "]x",
                prev = "[x",
            },
            suggestion = {
                accept = "<M-l>",
                next = "<M-]>",
                prev = "<M-[>",
                dismiss = "<C-]>",
            },
            jump = {
                next = "]]",
                prev = "[[",
            },
            submit = {
                normal = "<CR>",
                insert = "<C-s>",
            },
            -- NOTE: The following will be safely set by avante.nvim
            ask = "<leader>aa",
            edit = "<leader>ae",
            refresh = "<leader>ar",
            focus = "<leader>af",
            toggle = {
                default = "<leader>at",
                debug = "<leader>ad",
                hint = "<leader>ah",
                suggestion = "<leader>as",
                repomap = "<leader>aR",
            },
            sidebar = {
                apply_all = "A",
                apply_cursor = "a",
                switch_windows = "<Tab>",
                reverse_switch_windows = "<S-Tab>",
            },
        },
        keys = {
            {
                "<leader>ip",
                function()
                    return vim.bo.filetype == "AvanteInput" and require("avante.clipboard").paste_image() or require("img-clip").paste_image()
                end,
                desc = "clip: paste image",
            },
        },
    },
    build = "make",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        --- The below dependencies are optional,
        "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
        "zbirenbaum/copilot.lua", -- for providers='copilot'
        {
            -- support for image pasting
            "HakonHarnes/img-clip.nvim",
            event = "VeryLazy",
            opts = {
                -- recommended settings
                default = {
                    embed_image_as_base64 = false,
                    prompt_for_file_name = false,
                    drag_and_drop = {
                        insert_mode = true,
                    },
                },
            },
        },
        {
            -- Make sure to set this up properly if you have lazy=true
            "MeanderingProgrammer/render-markdown.nvim",
            opts = {
                file_types = { "markdown", "Avante" },
            },
            ft = { "markdown", "Avante" },
        },
    },
}
