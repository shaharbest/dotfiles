return {
  -- Treesitter Context Comment String integration
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = false,
    opts = {
      enable_autocmd = false, -- Avoids unnecessary autocommands
    },
  },

  -- Comment.nvim with Treesitter support
  {
    "numToStr/Comment.nvim",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    opts = {
      pre_hook = function(ctx)
        -- Use Treesitter context for commenting
        return require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()(ctx)
      end,
    },
  },
}
