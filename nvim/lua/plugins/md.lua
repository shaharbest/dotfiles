return {
  "iamcco/markdown-preview.nvim",
  ft = { "markdown" },
  build = function() vim.fn["mkdp#util#install"]() end,
  config = function()
    -- Plugin options
    vim.g.mkdp_auto_start = 0
    vim.g.mkdp_auto_close = 1
    vim.g.mkdp_refresh_slow = 0
    vim.g.mkdp_command_for_global = 0
    vim.g.mkdp_open_to_the_world = 0
    vim.g.mkdp_browser = "" -- Use system default browser
    -- vim.g.mkdp_theme = "light"
    vim.g.mkdp_theme = "dark"

    -- Keymap: toggle markdown preview with <leader>m
    vim.keymap.set("n", "<leader>m", function()
      if vim.g.mkdp_is_open == 1 then
        vim.cmd("MarkdownPreviewStop")
      else
        vim.cmd("MarkdownPreview")
      end
    end, { desc = "Toggle Markdown Preview" })
  end,
}
