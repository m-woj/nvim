local keymap = vim.keymap

-- increment/decrement
keymap.set("n", "+", "<c-a>")
keymap.set("n", "-", "<c-x>")

-- select all
keymap.set("n", "<c-a>", "gg<s-v>g")

-- new tab
local opts = { noremap = true, silent = true }

keymap.set("n", "te", ":tabedit<return>")
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

-- buffer switching
vim.keymap.set("n", "<c-k>", ":bnext<cr>", { desc = "next buffer" })
vim.keymap.set("n", "<c-j>", ":bprev<cr>", { desc = "previous buffer" })

-- <leader>-followed
--------------------

-- telsecope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "find file" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "find in file" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- which-key hints
vim.keymap.set("n", "<leader>?", function()
	require("which-key").show({ global = false })
end, { desc = "buffer local keymaps (which-key)" })

-- Neogit
keymap.set("n", "<leader>g", ":Neogit<return>", { desc = "Neogit menu" })

-- NvimTree
local ntree = require("nvim-tree.api")
keymap.set("n", "<leader>tt", ntree.tree.toggle, { desc = "Toggle Nvim Tree" })
keymap.set("n", "<leader>tr", ntree.tree.reload, { desc = "Reload Nvim Tree" })
keymap.set("n", "<leader>tff", ntree.tree.find_file, { desc = "Localize current file in a Tree" })
keymap.set("n", "<leader>tc", ":NvimTreeCollapseKeepBuffers<return>", { desc = "Collapse Tree, except opened buffers" })

-- Formatter
keymap.set("n", "<leader>f", ":Format<CR>", { desc = "Format code" })
keymap.set("n", "<leader>fw", ":FormatWrite<CR>", { desc = "Format and write code" })
