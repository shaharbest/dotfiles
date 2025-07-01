return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" }, -- Load only when opening a file
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "javascript", "typescript", "markdown" },
      auto_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
