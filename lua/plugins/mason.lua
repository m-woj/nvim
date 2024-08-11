-- LSP, formatters, DAP orchestrator

return {
	"williamboman/mason.nvim",
	config = function()
		require("mason").setup()
	end,
}
