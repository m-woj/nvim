-- Code completion

return {
  {
    "hrsh7th/nvim-cmp",
    -- event = 'InsertEnter',
    event = "VeryLazy",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "onsails/lspkind-nvim",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-omni",
      "hrsh7th/cmp-emoji",
      "quangnguyen30192/cmp-nvim-ultisnips",
    },
    config = function()
      require("cmp")
    end,
  },
}
