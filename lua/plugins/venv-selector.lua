return {
	"linux-cultist/venv-selector.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"nvim-telescope/telescope.nvim",
		"mfussenegger/nvim-dap-python",
	},
    branch = "regexp", -- This is the regexp branch, use this for the new version
	opts = {},
	event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
	keys = {
		{ "<leader>vs", "<cmd>VenvSelect<cr>" },
	},
}
