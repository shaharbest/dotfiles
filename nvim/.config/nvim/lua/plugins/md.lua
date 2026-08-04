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

-- # tsx highlighting in markdown-preview.nvim
--
-- The bundled highlight.js build (baked into the app's minified webpack bundle
-- under app/out/_next/static/<buildId>/pages/index.js) only registers
-- "javascript" and "typescript" as language names — there's no "tsx" language
-- or alias. Fenced ```tsx blocks call hljs.highlight("tsx", ...), which finds
-- nothing and renders with zero syntax coloring.
--
-- patch_tsx_highlight() below reuses the same webpack module as "typescript"
-- under the name "tsx" too, so ```tsx fences get TypeScript-grade highlighting
-- (keywords/strings/types/comments colored; JSX tags themselves aren't
-- specially colored since highlight.js v10 has no dedicated tsx grammar).
-- It runs after every plugin (re)install/build, so it survives `Lazy update`
-- without the manual re-apply the mermaid fix above needs.
local function patch_tsx_highlight()
  local matches = vim.fn.glob(vim.fn.stdpath("data") .. "/lazy/markdown-preview.nvim/app/out/_next/static/*/pages/index.js", false, true)
  local bundle = matches[1]
  if not bundle then return end

  local f = io.open(bundle, "r")
  if not f then return end
  local content = f:read("*a")
  f:close()

  if content:find('registerLanguage("tsx"', 1, true) then return end

  local patched, count = content:gsub('r%.registerLanguage%("typescript",n%((%d+)%)%)', function(id)
    return string.format('r.registerLanguage("typescript",n(%s)),r.registerLanguage("tsx",n(%s))', id, id)
  end)
  if count == 0 then return end

  local out = io.open(bundle, "w")
  if not out then return end
  out:write(patched)
  out:close()
end

return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
      patch_tsx_highlight()
    end,
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
        disable_sync_scroll = 1,
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
