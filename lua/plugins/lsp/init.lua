return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		require("mason-lspconfig").setup({
			automatic_installation = true,
		})

		local lsp = require("lspconfig")

		lsp.pyright.setup({})
		lsp.bashls.setup({})
		lsp.html.setup({})
		lsp.lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
				},
			},
		})
	end,
}
