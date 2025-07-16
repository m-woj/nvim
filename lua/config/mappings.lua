-- Compatibility for Lua 5.1/5.2+
table.unpack = table.unpack or unpack

local keymap = vim.keymap

-- Select all
keymap.set("v", "<c-a>", "gg0<s-v>G$")

-- Replace selection
keymap.set("v", "<c-r>", '"hy:%s/<C-r>h//gc<left><left><left>')

-- Window resizing
local resize_keys = {
    ["<C-w><left>"] = "<C-w><",
    ["<C-w><right>"] = "<C-w>>",
    ["<C-w><up>"] = "<C-w>+",
    ["<C-w><down>"] = "<C-w>-",
}
for k, v in pairs(resize_keys) do
    keymap.set("n", k, v)
end

-- Tabs
local tab_keys = {
    { "n", "<c-s>", ":tabnext<return>", { desc = "Next tab" } },
    { "n", "<c-a>", ":tabprevious<return>", { desc = "Previous tab" } },
    { "n", "<a-t>", ":tabedit<return>", { desc = "New tab" } },
    { "n", "<c-x>", ":tabclose<return>", { desc = "Close tab" } },
}
for _, args in ipairs(tab_keys) do
    keymap.set(table.unpack(args))
end

-- DAP (Debug Adapter Protocol)
local dap_keys = {
    {
        "n",
        "<F5>",
        function()
            require("dap").continue()
        end,
    },
    {
        "n",
        "<F10>",
        function()
            require("dap").step_over()
        end,
    },
    {
        "n",
        "<F11>",
        function()
            require("dap").step_into()
        end,
    },
    {
        "n",
        "<F12>",
        function()
            require("dap").step_out()
        end,
    },
}
for _, args in ipairs(dap_keys) do
    keymap.set(table.unpack(args))
end

-- Leap
local leap_keys = {
    { { "n", "x", "o", "v" }, "s", "<Plug>(leap-forward)" },
    { { "n", "x", "o", "v" }, "S", "<Plug>(leap-backward)" },
    { { "n", "x", "o", "v" }, "gs", "<Plug>(leap-from-window)" },
}
for _, args in ipairs(leap_keys) do
    keymap.set(table.unpack(args))
end

-- Telescope
local t_builtin = require("telescope.builtin")
local telescope_prefix = "<leader>s"
local telescope_keys = {
    { "n", "<leader>b", t_builtin.buffers, { desc = "search opened buffers" } },
    { "n", telescope_prefix .. "f", t_builtin.find_files, { desc = "search file" } },
    { "n", telescope_prefix .. "g", t_builtin.live_grep, { desc = "search string" } },
    { "v", telescope_prefix .. "g", t_builtin.grep_string, { desc = "search string" } },
    { "n", telescope_prefix .. "b", t_builtin.current_buffer_fuzzy_find, { desc = "search string in buffer" } },
    { "n", telescope_prefix .. "h", t_builtin.help_tags, { desc = "search in help tags" } },
    { "n", telescope_prefix .. "m", t_builtin.marks, { desc = "search marks" } },
    { "n", telescope_prefix .. "q", t_builtin.quickfix, { desc = "Lists items in the quickfix list" } },
    { "n", telescope_prefix .. "r", t_builtin.registers, { desc = "Lists vim registers" } },
    { "n", telescope_prefix .. "i", t_builtin.lsp_implementations, { desc = "Search implementation" } },
    { "n", telescope_prefix .. "d", t_builtin.lsp_definitions, { desc = "Search definition" } },
    { "n", telescope_prefix .. "t", t_builtin.lsp_type_definitions, { desc = "Search type definition" } },
    { "n", telescope_prefix .. "v", t_builtin.treesitter, { desc = "Search function names, variables" } },
}
for _, args in ipairs(telescope_keys) do
    keymap.set(table.unpack(args))
end

-- Which-key hints
keymap.set("n", "<leader>?", function()
    require("which-key").show({ global = false })
end, { desc = "buffer local keymaps (which-key)" })

-- Git (Neogit, DiffView, Telescope)
local git_prefix = "<leader>g"
local git_keys = {
    { "n", git_prefix .. "g", ":Neogit<return>", { desc = "Neogit menu" } },
    { "n", git_prefix .. "h", ":DiffviewFileHistory %<cr>", { desc = "DiffView current file history" } },
    { "n", git_prefix .. "H", ":DiffviewFileHistory<cr>", { desc = "DiffView history" } },
    { "n", git_prefix .. "c", t_builtin.git_bcommits, { desc = "Current buffer git commits" } },
    { "n", git_prefix .. "C", t_builtin.git_commits, { desc = "Lists git commits with diff preview, checkout action <cr>." } },
    { "v", git_prefix .. "c", t_builtin.git_bcommits_range, { desc = "Selected lines git commits" } },
    { "n", git_prefix .. "s", t_builtin.git_status, { desc = "Lists current changes per file with diff preview and add action" } },
    { "n", git_prefix .. "b", t_builtin.git_branches, { desc = "Lists all branches with log preview" } },
}
for _, args in ipairs(git_keys) do
    keymap.set(table.unpack(args))
end

-- Terminal (Toggleterm)
keymap.set("n", "<leader>T", ":ToggleTerm<return>", { desc = "Toggle terminal" })

-- NvimTree
local ntree = require("nvim-tree.api")
local tree_prefix = "<leader>t"
local tree_mappings = {
    t = { ntree.tree.toggle, "Toggle Nvim Tree" },
    l = { ntree.tree.find_file, "Localize current file in a Tree" },
    c = { ":NvimTreeCollapseKeepBuffers<return>", "Collapse Tree, except opened buffers" },
    r = { ntree.tree.reload, "Refresh Tree" },
    a = { ntree.tree.expand_all, "Expand all nodes" },
    A = { ntree.tree.collapse_all, "Collapse all nodes" },
    h = { ntree.tree.toggle_help, "Toggle help" },
    g = { ntree.tree.toggle_gitignore_filter, "Toggle gitignore filter" },
    e = { ntree.node.open.edit, "Open file in current window" },
    v = { ntree.node.open.vertical, "Open file in vertical split" },
    s = { ntree.node.open.horizontal, "Open file in horizontal split" },
    p = { ntree.node.open.preview, "Preview file without focus" },
    n = { ntree.fs.create, "Create file/directory" },
}
for suffix, map in pairs(tree_mappings) do
    keymap.set("n", tree_prefix .. suffix, map[1], { desc = map[2] })
end

-- Formatting (Conform)
local conform_keys = {
    {
        "n",
        "<leader>f",
        function()
            require("conform").format()
        end,
        { desc = "Format code" },
    },
    {
        "n",
        "<leader>w",
        function()
            require("conform").format()
            vim.cmd("write")
        end,
        { desc = "Format and save code" },
    },
}
for _, args in ipairs(conform_keys) do
    keymap.set(table.unpack(args))
end

-- Overseer
local overseer_keys = {
    { "n", "<leader>o", ":OverseerToggle<CR>", { desc = "Toggle Overseer" } },
    { "n", "<leader>r", ":OverseerRun<CR>", { desc = "Overseer tasks run" } },
}
for _, args in ipairs(overseer_keys) do
    keymap.set(table.unpack(args))
end

-- Buffer manager
keymap.set("n", "<leader>B", require("buffer_manager.ui").toggle_quick_menu, { desc = "Toggle buffers list" })

-- Rename (IncRename)
keymap.set("n", "<leader>R", ":IncRename ", { desc = "Incremental rename" })

-- Python venv (Venv-selector)
keymap.set("n", "<leader>V", "<cmd>VenvSelect<cr>", { desc = "Select Python environment" })

-- DAP (Debug Adapter Protocol) leader mappings
local dap_prefix = "<leader>d"
local dap_leader_mappings = {
    b = {
        function()
            require("dap").toggle_breakpoint()
        end,
        "Toggle breakpoint",
    },
    r = {
        function()
            require("dap").repl.open()
        end,
        "Open REPL",
    },
    l = {
        function()
            require("dap").run_last()
        end,
        "Run last",
    },
    h = {
        function()
            require("dap.ui.widgets").hover()
        end,
        "Hover widgets",
        { "n", "v" },
    },
    p = {
        function()
            require("dap.ui.widgets").preview()
        end,
        "Preview",
        { "n", "v" },
    },
    f = {
        function()
            local widgets = require("dap.ui.widgets")
            widgets.centered_float(widgets.frames)
        end,
        "List frames",
    },
    s = {
        function()
            local widgets = require("dap.ui.widgets")
            widgets.centered_float(widgets.scopes)
        end,
        "List scopes",
    },
}
for suffix, map in pairs(dap_leader_mappings) do
    local modes = map[3] or "n"
    keymap.set(modes, dap_prefix .. suffix, map[1], { desc = map[2] })
end

-- Trouble
local trouble_prefix = "<leader>x"
local trouble_keys = {
    { "n", trouble_prefix .. "X", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics" } },
    { "n", trouble_prefix .. "x", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics" } },
    { "n", trouble_prefix .. "s", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols" } },
    { "n", trouble_prefix .. "d", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "LSP Definitions / references" } },
    { "n", trouble_prefix .. "l", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List" } },
    { "n", trouble_prefix .. "q", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List" } },
}
for _, args in ipairs(trouble_keys) do
    keymap.set(table.unpack(args))
end

-- Spectre
local spectre_keys = {
    { "n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', { desc = "Toggle Spectre" } },
    { "n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', { desc = "Search current word" } },
}
for _, args in ipairs(spectre_keys) do
    keymap.set(table.unpack(args))
end

-- Neotest
-- (moved to lua/plugins/neotest.lua because of long load time)
