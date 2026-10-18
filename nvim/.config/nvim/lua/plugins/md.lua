return {
  {
    "jannis-baum/vivify.vim",
    ft = { "markdown" },
    keys = {
      { "<leader>mp", "<cmd>Viv<cr>", desc = "Preview Markdown (Vivify)" },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = "markdown",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<leader>mP", "<cmd>RenderMarkdown toggle<cr>", desc = "Toggle Markdown Render" },
    },
    opts = {},
  },
}
