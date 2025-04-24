return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  {
    "nvim-telescope/telescope.nvim",
    -- tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
    },
    config = function()
      require("telescope").setup({
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
            ["<C-j>"] = require('telescope.actions').move_selection_next,
            ["<C-k>"] = require('telescope.actions').move_selection_previous,
          },
        },
        pickers = {
          find_files = {
            -- hidden = true,
            theme = "ivy",
            -- theme = "dropdown",
          },
        },
        defaults = {
          file_ignore_patterns = {
            "node_modules/.*",
            ".meteor/.*",
            ".git/*"
          },
          layout_strategy = "horizontal",
          layout_config = {
            -- preview_width = 0.65,
            horizontal = {
              size = {
                width = "95%",
                height = "95%",
              },
            },
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
          fzf = {                           -- Configure the fzf extension
            fuzzy = true,                   -- Enable fuzzy search
            override_generic_sorter = true, -- Override the generic sorter
            override_file_sorter = true,    -- Override the file sorter
            case_mode = "smart_case",       -- Options: "smart_case", "ignore_case", "respect_case"
          },
        },
      })
      local builtin = require "telescope.builtin"

      vim.keymap.set("n", "<leader>fd", builtin.find_files)
      vim.keymap.set("n", "<leader>fg", builtin.live_grep)
      vim.keymap.set("n", "<leader>fb", builtin.buffers)
      vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find)
      vim.keymap.set({ 'n', 'v' }, '<leader>gw', builtin.grep_string)
      vim.keymap.set("n", "<leader><leader>", builtin.oldfiles)
      vim.keymap.set('n', '<leader>gs', builtin.git_status)
      vim.keymap.set('n', '<leader>tr', builtin.resume)
      vim.keymap.set("n", "<leader>en", function()
        builtin.find_files { cwd = vim.fn.stdpath "config" }
      end)

      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("fzf")
    end,
  },
}
