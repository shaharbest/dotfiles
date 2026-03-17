return {
  {
    "goolord/alpha-nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    event = "VimEnter",
    config = function()
      if vim.fn.argc() > 0 then return end
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.startify")
      alpha.setup(dashboard.opts)
    end,
  }
}
