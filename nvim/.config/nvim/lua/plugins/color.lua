return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    compile = { enabled = true },
    -- flavour = "latte", -- auto, latte, frappe, macchiato, mocha
    flavour = "mocha",   -- auto, latte, frappe, macchiato, mocha
    term_colors = true,
    styles = { comments = { "italic" }, conditionals = { "italic" } },
    integrations = { cmp = true },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end,
}
