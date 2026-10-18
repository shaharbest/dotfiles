-- # Vivify (browser preview, <leader>mp)
--
-- vivify.vim is only a client; it needs the `viv` binary on PATH (not managed
-- by lazy). Setup on a new machine:
--   omarchy pkg aur add vivify-bin   # check: viv --version
--   :Lazy sync                       # install vivify.vim
--   :Lazy clean                      # drop old markdown-preview.nvim, if present
--
-- TODO (2026-10-18, pending after reboot): run the steps above, then verify
-- with a .md file containing a mermaid `xychart-beta` block and a ```tsx
-- fence: <leader>mp opens the browser, both render, edits reload live.
-- Vivify follows the cursor; to disable, find the option in `:h vivify`.
-- Remove this TODO once verified.
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
