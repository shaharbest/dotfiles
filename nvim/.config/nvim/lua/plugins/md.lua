-- # Vivify (browser preview, <leader>mp)
--
-- vivify.vim is only a client; it needs the `viv` binary on PATH (not managed
-- by lazy). Setup on a new machine:
--   omarchy pkg aur add vivify-bin   # check: viv --version
--   :Lazy sync                       # install vivify.vim
-- The preview follows the cursor; disable with `vim.g.vivify_auto_scroll = 0`.
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
