local keymap = vim.keymap

-- increment/decrement
keymap.set("n", "+", "<c-a>")
keymap.set("n", "-", "<c-x>")

-- select all
keymap.set("v", "<c-a>", "gg<s-v>G")
keymap.set("v", "<c-r>", '"hy:%s/<C-r>h//gc<left><left><left>')

-- Tabs
local opts = { noremap = true, silent = true }

keymap.set("n", "<tab>", ":tabnext<return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- buffer
vim.keymap.set("n", "<c-s>", ":bnext<cr>", { desc = "next buffer" })
vim.keymap.set("n", "<c-a>", ":bprev<cr>", { desc = "previous buffer" })
vim.keymap.set("n", "<c-d>", ":bd!<cr>", { desc = "Delete buffer" })

-- DAP
vim.keymap.set("n", "<F5>", function()
    require("dap").continue()
end)
vim.keymap.set("n", "<F10>", function()
    require("dap").step_over()
end)
vim.keymap.set("n", "<F11>", function()
    require("dap").step_into()
end)
vim.keymap.set("n", "<F12>", function()
    require("dap").step_out()
end)

-- <leader>-followed
--------------------------------------------------------------------------------

-- Tabs
keymap.set("n", "<leader><s-tab>", ":tabclose<return>")
keymap.set("n", "<leader><tab>", ":tabedit<return>")

-- telsecope
local t_builtin = require("telescope.builtin")
local prefix = "<leader>s"
keymap.set("n", prefix .. "f", t_builtin.find_files, { desc = "search file" })
keymap.set("n", prefix .. "g", t_builtin.live_grep, { desc = "search string" })
keymap.set("v", prefix .. "g", t_builtin.grep_string, { desc = "search string" })
keymap.set(
    "n",
    prefix .. "b",
    t_builtin.current_buffer_fuzzy_find,
    { desc = "search string in buffer" }
)
keymap.set("n", prefix .. "h", t_builtin.help_tags, { desc = "search in help tags" })
keymap.set("n", prefix .. "m", t_builtin.marks, { desc = "search marks" })
keymap.set("n", prefix .. "q", t_builtin.quickfix, { desc = "Lists items in the quickfix list" })
keymap.set("n", prefix .. "r", t_builtin.registers, { desc = "Lists vim registers" })
keymap.set("n", prefix .. "i", t_builtin.lsp_implementations, { desc = "Search implementation" })
keymap.set("n", prefix .. "d", t_builtin.lsp_definitions, { desc = "Search definition" })
keymap.set("n", prefix .. "t", t_builtin.lsp_type_definitions, { desc = "Search type definition" })
keymap.set("n", prefix .. "v", t_builtin.treesitter, { desc = "Search function names, variables" })

-- which-key hints
vim.keymap.set("n", "<leader>?", function()
    require("which-key").show({ global = false })
end, { desc = "buffer local keymaps (which-key)" })

-- Neogit + DiffView + Telescope
prefix = "<leader>g"
-- Neogit
keymap.set("n", prefix .. "g", ":Neogit<return>", { desc = "Neogit menu" })

-- DiffView
keymap.set(
    "n",
    prefix .. "h",
    ":DiffviewFileHistory %<cr>",
    { desc = "DiffView current file history" }
)
keymap.set("n", prefix .. "H", ":DiffviewFileHistory<cr>", { desc = "DiffView history" })

-- Telescope
keymap.set("n", prefix .. "c", t_builtin.git_bcommits, { desc = "Current buffer git commits" })
keymap.set("n", prefix .. "C", t_builtin.git_commits, {
    desc = "Lists git commits with diff preview, checkout action <cr>.",
})
keymap.set(
    "v",
    prefix .. "c",
    t_builtin.git_bcommits_range,
    { desc = "Selected lines git commits" }
)
keymap.set(
    "n",
    prefix .. "s",
    t_builtin.git_status,
    { desc = "Lists current changes per file with diff preview and add action" }
)
keymap.set(
    "n",
    prefix .. "b",
    t_builtin.git_branches,
    { desc = "Lists all branches with log preview" }
)

-- Toggleterm
keymap.set("n", "<leader>T", ":ToggleTerm<return>", { desc = "Toggle terminal" })

-- NvimTree
local ntree = require("nvim-tree.api")
keymap.set("n", "<leader>tt", ntree.tree.toggle, { desc = "Toggle Nvim Tree" })
keymap.set("n", "<leader>tl", ntree.tree.find_file, { desc = "Localize current file in a Tree" })
keymap.set(
    "n",
    "<leader>tc",
    ":NvimTreeCollapseKeepBuffers<return>",
    { desc = "Collapse Tree, except opened buffers" }
)

-- Conform formatter
keymap.set("n", "<leader>f", function()
    require("conform").format({ async = true })
end, { desc = "Format code" })

-- Overseer
keymap.set("n", "<leader>o", ":OverseerToggle<CR>", { desc = "Toggle Overseer" })
keymap.set("n", "<leader>r", ":OverseerRun<CR>", { desc = "Overseer tasks run" })

-- Buffer manager
keymap.set(
    "n",
    "<leader>b",
    require("buffer_manager.ui").toggle_quick_menu,
    { desc = "Toggle buffers list" }
)

-- Inc rename
keymap.set("n", "<leader>R", ":IncRename ", { desc = "Incremental rename" })

-- Venv-selector
keymap.set("n", "<leader>v", "<cmd>VenvSelect<cr>", { desc = "Select Python environment" })

-- AI
prefix = "<leader>a"
if vim.g.ai_cmp_engine == "copilot" then
    keymap.set("n", prefix .. "c", ":CopilotChatToggle<CR>", { desc = "Toggle Copilot Chat" })
    keymap.set("n", prefix .. "s", ":CopilotChatStop<CR>", { desc = "Stop current copilot output" })
    keymap.set("n", prefix .. "R", ":CopilotChatReset<CR>", { desc = "Reset chat window" })

    keymap.set(
        "v",
        prefix .. "e",
        ":CopilotChatExplain<CR>",
        { desc = "Write an explanation for the active selection as paragraphs of text" }
    )
    keymap.set("v", prefix .. "r", ":CopilotChatReview<CR>", { desc = "Review the selected code" })
    keymap.set(
        "v",
        prefix .. "f",
        ":CopilotChatFix<CR>",
        { desc = "Rewrite the code to show it with the bug fixed" }
    )
    keymap.set(
        "v",
        prefix .. "o",
        ":CopilotChatOptimize<CR>",
        { desc = "Optimize the selected code to improve performance and readablilty" }
    )
    keymap.set(
        "v",
        prefix .. "t",
        ":CopilotChatTests<CR>",
        { desc = "Please generate tests for my code" }
    )
    keymap.set(
        "v",
        prefix .. "F",
        ":CopilotChatFixDiagnostic<CR>",
        { desc = "Please assist with the following diagnostic issue in file" }
    )
end

-- DAP
prefix = "<leader>d"
vim.keymap.set("n", prefix .. "b", function()
    require("dap").toggle_breakpoint()
end, {
    desc = "Toggle breakpoint",
})
vim.keymap.set("n", prefix .. "r", function()
    require("dap").repl.open()
end, {
    desc = "Open REPL",
})
vim.keymap.set("n", prefix .. "l", function()
    require("dap").run_last()
end, {
    desc = "Run last",
})
vim.keymap.set({ "n", "v" }, prefix .. "h", function()
    require("dap.ui.widgets").hover()
end, {
    desc = "Hover widgets",
})
vim.keymap.set({ "n", "v" }, prefix .. "p", function()
    require("dap.ui.widgets").preview()
end, {
    desc = "Preview",
})
vim.keymap.set("n", prefix .. "f", function()
    local widgets = require("dap.ui.widgets")
    widgets.centered_float(widgets.frames)
end, {
    desc = "List frames",
})
vim.keymap.set("n", prefix .. "s", function()
    local widgets = require("dap.ui.widgets")
    widgets.centered_float(widgets.scopes)
end, {
    desc = "List scopes",
})
