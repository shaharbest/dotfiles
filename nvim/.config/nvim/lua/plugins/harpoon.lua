return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup({
      settings = {
        save_on_toggle = true,   -- Save the harpoon file when toggling the quick menu
        save_on_change = true,   -- Save on every change (recommended)
      },
    })

    -- Keybindings
    vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end,
      { desc = "Harpoon: Add file to list" })
    -- vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end, { desc = "Harpoon: Add file to list" })
    vim.keymap.set("n", "<leader>he", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
      { desc = "Harpoon: Toggle quick menu" })
    vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end,
      { desc = "Harpoon: Go to file 1" })
    vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end,
      { desc = "Harpoon: Go to file 2" })
    vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end,
      { desc = "Harpoon: Go to file 3" })
    vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end,
      { desc = "Harpoon: Go to file 4" })
    vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end,
      { desc = "Harpoon: Previous file" })
    vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end,
      { desc = "Harpoon: Next file" })
  end,
}
