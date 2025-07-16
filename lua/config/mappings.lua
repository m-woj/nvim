local keymap = vim.keymap

-- select all
keymap.set("v", "<c-a>", "gg0<s-v>G$")

-- replace
keymap.set("v", "<c-r>", '"hy:%s/<C-r>h//gc<left><left><left>')

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- tabs
keymap.set("n", "<c-s>", ":tabnext<return>", { desc = "Next tab" })
keymap.set("n", "<c-a>", ":tabprevious<return>", { desc = "Previous tab" })
keymap.set("n", "<a-t>", ":tabedit<return>", { desc = "New tab" })
keymap.set("n", "<c-x>", ":tabclose<return>", { desc = "Close tab" })

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

-- Leap
vim.keymap.set({ "n", "x", "o", "v" }, "s", "<Plug>(leap-forward)")
vim.keymap.set({ "n", "x", "o", "v" }, "S", "<Plug>(leap-backward)")
vim.keymap.set({ "n", "x", "o", "v" }, "gs", "<Plug>(leap-from-window)")

-- <leader>-followed
--------------------------------------------------------------------------------

-- telsecope
local t_builtin = require("telescope.builtin")
keymap.set("n", "<leader>b", t_builtin.buffers, { desc = "search opened buffers" })
local prefix = "<leader>s"
keymap.set("n", prefix .. "f", t_builtin.find_files, { desc = "search file" })
keymap.set("n", prefix .. "g", t_builtin.live_grep, { desc = "search string" })
keymap.set("v", prefix .. "g", t_builtin.grep_string, { desc = "search string" })
keymap.set("n", prefix .. "b", t_builtin.current_buffer_fuzzy_find, { desc = "search string in buffer" })
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
keymap.set("n", prefix .. "h", ":DiffviewFileHistory %<cr>", { desc = "DiffView current file history" })
keymap.set("n", prefix .. "H", ":DiffviewFileHistory<cr>", { desc = "DiffView history" })

-- Telescope
keymap.set("n", prefix .. "c", t_builtin.git_bcommits, { desc = "Current buffer git commits" })
keymap.set("n", prefix .. "C", t_builtin.git_commits, {
    desc = "Lists git commits with diff preview, checkout action <cr>.",
})
keymap.set("v", prefix .. "c", t_builtin.git_bcommits_range, { desc = "Selected lines git commits" })
keymap.set("n", prefix .. "s", t_builtin.git_status, { desc = "Lists current changes per file with diff preview and add action" })
keymap.set("n", prefix .. "b", t_builtin.git_branches, { desc = "Lists all branches with log preview" })

-- Toggleterm
keymap.set("n", "<leader>T", ":ToggleTerm<return>", { desc = "Toggle terminal" })

-- NvimTree
local ntree = require("nvim-tree.api")
prefix = "<leader>t"
keymap.set("n", prefix .. "t", ntree.tree.toggle, { desc = "Toggle Nvim Tree" })
keymap.set("n", prefix .. "l", ntree.tree.find_file, { desc = "Localize current file in a Tree" })
keymap.set("n", prefix .. "c", ":NvimTreeCollapseKeepBuffers<return>", { desc = "Collapse Tree, except opened buffers" })
keymap.set("n", prefix .. "r", ntree.tree.reload, { desc = "Refresh Tree" })
keymap.set("n", prefix .. "a", ntree.tree.expand_all, { desc = "Expand all nodes" })
keymap.set("n", prefix .. "A", ntree.tree.collapse_all, { desc = "Collapse all nodes" })
keymap.set("n", prefix .. "h", ntree.tree.toggle_help, { desc = "Toggle help" })
keymap.set("n", prefix .. "g", ntree.tree.toggle_gitignore_filter, { desc = "Toggle gitignore filter" })
keymap.set("n", prefix .. "e", ntree.node.open.edit, { desc = "Open file in current window" })
keymap.set("n", prefix .. "v", ntree.node.open.vertical, { desc = "Open file in vertical split" })
keymap.set("n", prefix .. "s", ntree.node.open.horizontal, { desc = "Open file in horizontal split" })
keymap.set("n", prefix .. "p", ntree.node.open.preview, { desc = "Preview file without focus" })
keymap.set("n", prefix .. "n", ntree.fs.create, { desc = "Create file/directory" })

-- Conform formatter
keymap.set("n", "<leader>f", function()
    require("conform").format()
end, { desc = "Format code" })
keymap.set("n", "<leader>w", function()
    require("conform").format()
    vim.cmd("write")
end, { desc = "Format and save code" })

-- Overseer
keymap.set("n", "<leader>o", ":OverseerToggle<CR>", { desc = "Toggle Overseer" })
keymap.set("n", "<leader>r", ":OverseerRun<CR>", { desc = "Overseer tasks run" })

-- Buffer manager
keymap.set("n", "<leader>B", require("buffer_manager.ui").toggle_quick_menu, { desc = "Toggle buffers list" })

-- Inc rename
keymap.set("n", "<leader>R", ":IncRename ", { desc = "Incremental rename" })

-- Venv-selector
keymap.set("n", "<leader>V", "<cmd>VenvSelect<cr>", { desc = "Select Python environment" })

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

-- Gitlab
if vim.g.gitlab_token then
    local gitlab = require("gitlab")
    prefix = "<leader>G"
    vim.keymap.set("n", prefix .. "M", gitlab.choose_merge_request)
    vim.keymap.set("n", prefix .. "s", gitlab.summary)
    vim.keymap.set("n", prefix .. "r", gitlab.review)
    vim.keymap.set("n", prefix .. "b", gitlab.open_in_browser)
    vim.keymap.set("n", prefix .. "c", gitlab.create_comment)
    vim.keymap.set("v", prefix .. "c", gitlab.create_multiline_comment)
    vim.keymap.set("n", prefix .. "n", gitlab.create_note)
    vim.keymap.set("n", prefix .. "d", gitlab.toggle_discussions)
end

-- Trouble
prefix = "<leader>x"
vim.keymap.set("n", prefix .. "X", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics" })
vim.keymap.set("n", prefix .. "x", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", {
    desc = "Buffer Diagnostics",
})
vim.keymap.set("n", prefix .. "s", "<cmd>Trouble symbols toggle focus=false<cr>", {
    desc = "Symbols",
})
vim.keymap.set("n", prefix .. "d", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "LSP Definitions / references" })
vim.keymap.set("n", prefix .. "l", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List" })
vim.keymap.set("n", prefix .. "q", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List" })

-- Spectre
vim.keymap.set("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre",
})
vim.keymap.set("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word",
})

-- Neotest
-- prefix e
-- moved to lua/plugins/neotest.lua because of long load time
