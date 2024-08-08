-- <leader>-followed
--------------------

-- Telsecope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find file" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Find in file" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Which-key hints
local which_key = require("which-key")
vim.keymap.set('n', '<leader>?',
    function()
        require("which-key").show({ global = false })
    end
, { desc = "Buffer Local Keymaps (which-key)" })
