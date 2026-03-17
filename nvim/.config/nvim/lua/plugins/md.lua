return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = "cd app && pnpm install",
    keys = {
      { "<leader>mP", "<cmd>MarkdownPreviewToggle<cr>", desc = "Toggle Markdown Preview (browser)" },
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
      { "<leader>mp", "<cmd>RenderMarkdown toggle<cr>", desc = "Toggle Markdown Render" },
    },
    opts = {},
  },
}
