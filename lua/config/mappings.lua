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
vim.keymap.set("n", "<c-x>", ":bd!<cr>", { desc = "Delete buffer" })

-- <leader>-followed
--------------------

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

-- Neogit + Telescope
prefix = "<leader>g"
keymap.set("n", prefix .. "g", ":Neogit<return>", { desc = "Neogit menu" })
keymap.set("n", prefix .. "c", t_builtin.git_bcommits, { desc = "Current buffer git commits" })
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

-- Venv-selector
keymap.set("n", "<leader>v", "<cmd>VenvSelect<cr>", { desc = "Select Python environment" })

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
vim.keymap.set("n", "<Leader>p", function()
    require("dap").toggle_breakpoint()
end)
vim.keymap.set("n", "<Leader>dr", function()
    require("dap").repl.open()
end)
vim.keymap.set("n", "<Leader>dl", function()
    require("dap").run_last()
end)
vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
    require("dap.ui.widgets").hover()
end)
vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
    require("dap.ui.widgets").preview()
end)
vim.keymap.set("n", "<Leader>df", function()
    local widgets = require("dap.ui.widgets")
    widgets.centered_float(widgets.frames)
end)
vim.keymap.set("n", "<Leader>ds", function()
    local widgets = require("dap.ui.widgets")
    widgets.centered_float(widgets.scopes)
end)
