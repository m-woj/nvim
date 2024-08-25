return {
	"ludovicchabant/vim-gutentags",
    lazy = true,
    event = "VeryLazy",
	config = function()
		vim.g.gutentags_ctags_tagfile = ".nvim/tags"
	end,
}
