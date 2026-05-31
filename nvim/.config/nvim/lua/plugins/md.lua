-- # mermaid version in markdown-preview.nvim
--
-- The plugin bundles its own mermaid.min.js under:
--   ~/.local/share/nvim/lazy/markdown-preview.nvim/app/_static/mermaid.min.js
--
-- The upstream maintainer rarely bumps it (was 10.2.3; xychart-beta needs ≥10.6.0).
-- Manual fix applied (2026-05-27) — replace with any newer build from jsDelivr:
--   curl -L https://cdn.jsdelivr.net/npm/mermaid@11.7.0/dist/mermaid.min.js \
--     -o ~/.local/share/nvim/lazy/markdown-preview.nvim/app/_static/mermaid.min.js
--
-- Repeat after each `Lazy update` that reinstalls the plugin (the file gets overwritten).
-- Check the installed version with:
--   grep -oP 'version:"\d+\.\d+\.\d+"' ~/.local/share/nvim/lazy/markdown-preview.nvim/app/_static/mermaid.min.js
--
-- Alternatives to this manual patch:
--   1. Switch to headlines.nvim or render-markdown.nvim + a browser that loads mermaid
--      from CDN — no bundled JS to maintain.
--   2. Use mermaid.nvim (https://github.com/chaosattractor/mermaid.nvim) which shells
--      out to a local `mmdc` binary (npm install -g @mermaid-js/mermaid-cli).
--      You control the version; upgrading is just `npm update -g`.
--   3. Wait for PR #723 on iamcco/markdown-preview.nvim to be merged — it bumps the
--      bundle to 11.7.0 and would make the manual curl unnecessary going forward.

return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
    keys = {
      { "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Toggle Markdown Preview (browser)" },
    },
    init = function()
      vim.g.mkdp_preview_options = {
        maid = {
          themeVariables = {
            taskTextDarkColor = "#222222",
          },
        },
      }
    end,
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
