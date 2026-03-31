return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    keys = {
      { "<leader>f",  "<cmd>Telescope find_files<cr>" },
      { "<leader>g",  "<cmd>Telescope live_grep<cr>" },
      { "<leader>b",  "<cmd>Telescope buffers<cr>" },
      { "<leader>si", "<cmd>Telescope grep_string<cr>" },
      { "<leader>so", "<cmd>Telescope oldfiles<cr>" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>" },
      { "<leader>sm", "<cmd>Telescope man_pages<cr>" },
      { "<leader>sr", "<cmd>Telescope lsp_references<cr>" },
      { "<leader>st", "<cmd>Telescope builtin<cr>" },
      { "<leader>sd", "<cmd>Telescope lsp_definitions<cr>" },
      { "<leader>sc", "<cmd>Telescope git_bcommits<cr>" },
      { "<leader>sg", "<cmd>Telescope git_status<cr>" },
      { "<leader>se", "<cmd>Telescope env<cr>" },
    },
    opts = {
      defaults = {
        vimgrep_arguments = {
          'rg', '--color=never', '--no-heading', '--with-filename',
          '--line-number', '--column', '--smart-case',
          -- '--hidden',
        },
        preview = { treesitter = false },
        color_devicons = true,
        sorting_strategy = "ascending",
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        path_display = { "smart" },
        layout_config = { height = 100, width = 400, prompt_position = "top", preview_cutoff = 40 },
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("ui-select")
      telescope.load_extension("env")
    end,
  },

  { "nvim-telescope/telescope-ui-select.nvim", lazy = true },
  { "LinArcX/telescope-env.nvim",              lazy = true },
}
