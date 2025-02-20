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
        pickers = {
          find_files = {
            hidden = true,
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
          fzf = { -- Configure the fzf extension
            fuzzy = true,                    -- Enable fuzzy search
            override_generic_sorter = true, -- Override the generic sorter
            override_file_sorter = true,    -- Override the file sorter
            case_mode = "smart_case",       -- Options: "smart_case", "ignore_case", "respect_case"
          },
        },
      })
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      -- vim.keymap.set("n", "<leader>fG", builtin.grep_string, {})
      -- do it also in select mode abd normal mode
      vim.keymap.set({'n', 'v'}, '<leader>fG', builtin.grep_string, {})
      vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})
      vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
      vim.keymap.set('n', '<leader>tr', builtin.resume, {})

      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("fzf")
    end,
  },
}
-- return {
--   {
--     "nvim-treesitter/nvim-treesitter",
--     build = ":TSUpdate",
--     dependencies = {
--       "nvim-treesitter/nvim-treesitter-textobjects",
--       "nvim-treesitter/playground",
--     },
--     config = function()
--       local config = require("nvim-treesitter.configs")
--       config.setup({
--         ensure_installed = { "javascript", "jsdoc" },
--         auto_install = true,
--         highlight = { enable = true },
--         indent = { enable = true },
--         fold = { enable = true },
--         playground = { enable = true },
--         textobjects = {
--           select = {
--             enable = false,
--             lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
--             keymaps = {
--               -- You can use the capture groups defined in textobjects.scm
--               ['aa'] = '@parameter.outer',
--               ['ia'] = '@parameter.inner',
--               -- ['aF'] = '@function.outer',
--               -- ['iF'] = '@function.inner',
--               ['ac'] = '@class.outer',
--               ['ic'] = '@class.inner',
--               ['ii'] = '@conditional.inner',
--               ['ai'] = '@conditional.outer',
--               -- ['il'] = '@loop.inner',
--               -- ['al'] = '@loop.outer',
--               ['at'] = '@comment.outer',
--             },
--           },
--           move = {
--             enable = true,
--             set_jumps = true, -- whether to set jumps in the jumplist
--             goto_next_start = {
--               [']f'] = '@function.outer',
--               [']]'] = '@class.outer',
--             },
--             goto_next_end = {
--               [']F'] = '@function.outer',
--               [']['] = '@class.outer',
--             },
--             goto_previous_start = {
--               ['[f'] = '@function.outer',
--               ['[['] = '@class.outer',
--             },
--             goto_previous_end = {
--               ['[F'] = '@function.outer',
--               ['[]'] = '@class.outer',
--             },
--           },
--           swap = {
--             enable = true,
--             swap_next = { ['<leader>a'] = '@parameter.inner', },
--             swap_previous = { ['<leader>A'] = '@parameter.inner', },
--           },
--         },
--       })
--     end
--   }
-- }
