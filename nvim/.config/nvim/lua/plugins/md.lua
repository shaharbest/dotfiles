return {
  "toppair/peek.nvim",
  event = { "VeryLazy" },
  build = "deno task --quiet build:fast",
  keys = {
    { "<leader>mp", "<cmd>lua require('peek').open()<cr>", desc = "Peek (Markdown Preview)" },
  },
  config = function()
    require("peek").setup({
      app = "webview",
      theme = "dark",
    })
  end,
}
