return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = { "MunifTanjim/nui.nvim" },
  cmd = "Neotree",
  keys = {
    { "<C-n>",      "<cmd>Neotree toggle<cr>" },
    { "<leader>bf", "<cmd>Neotree buffers reveal float<cr>" },
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        follow_current_file = { enabled = true },
        hijack_netrw_behavior = "open_current",
        filtered_items = {
          always_show = {
            ".server",
          },
        },
      },
    })
  end,
}
