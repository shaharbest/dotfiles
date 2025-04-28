return {
  "iamcco/markdown-preview.nvim",
  ft = { "markdown" },
  build = function() vim.fn["mkdp#util#install"]() end,
  init = function()
    vim.g.mkdp_auto_start = 0
    vim.g.mkdp_auto_close = 1
    vim.g.mkdp_refresh_slow = 0
    vim.g.mkdp_command_for_global = 0
    vim.g.mkdp_open_to_the_world = 0
    vim.g.mkdp_browser = ""
    vim.g.mkdp_theme = "dark"
  end,
  config = function()
    vim.keymap.set("n", "<leader>m", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Toggle Markdown Preview" })
  end,
}
