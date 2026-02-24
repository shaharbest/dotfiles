return {
  "aznhe21/actions-preview.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  keys = { { "<leader>sa", function() require("actions-preview").code_actions() end, desc = "Code actions" } },
  config = function()
    require("actions-preview").setup {
      backend = { "telescope" },
      telescope = require("telescope.themes").get_dropdown({}),
    }
  end,
}
