return {
  -- Mason setup for managing LSPs and formatters/linters
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- mason-lspconfig for easier LSP installation and management
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "bashls",
        "html",
        "jsonls",
        "lua_ls",
        "ts_ls",
        "yamlls",
        "pylsp",
        "ruff",
      },
      automatic_installation = true,
    },
  },

  -- nvim-lspconfig setup
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      -- Define configurations for specific language servers
      local servers = {
        ts_ls = {
          filetypes = {
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx",
          },
          root_dir = lspconfig.util.root_pattern(".meteor", "package.json", ".git"),
          init_options = { preferences = { disableSuggestions = false } },
        },
        html = {},
        lua_ls = {},
        ruff = {},
        jsonls = {},
        yamlls = {},
        bashls = {},
        pylsp = {
          settings = {
            pylsp = {
              plugins = {
                pyflakes = { enabled = false },
                pycodestyle = { enabled = false },
                autopep8 = { enabled = false },
                yapf = { enabled = false },
                mccabe = { enabled = false },
                pylsp_mypy = { enabled = false },
                pylsp_black = { enabled = false },
                pylsp_isort = { enabled = false },
              },
            },
          },
        },
      }

      -- Setup all the servers dynamically
      for server, config in pairs(servers) do
        lspconfig[server].setup({
          capabilities = capabilities,
          settings = config.settings, -- Use 'settings' consistently
          filetypes = config.filetypes,
          root_dir = config.root_dir,
          init_options = config.init_options,
        })
      end

      -- Set key mappings for common LSP actions
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show documentation" })
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Show references" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
      vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, { desc = "Rename" })

      -- Diagnostic key mappings
      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostics" })
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
      vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Show diagnostics in quickfix" })
    end,
  },

  -- null-ls for formatting and linting (using mason-null-ls)
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "williamboman/mason.nvim", -- Ensure mason is a dependency
      "nvimtools/none-ls-extras.nvim",
      "jay-babu/mason-null-ls.nvim",
    },
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = {
          "checkmake",
          "prettier",
          "stylua",
          "eslint_d",
          "shfmt",
          "ruff",
        },
        automatic_installation = true,
      })

      local null_ls = require("null-ls")
      local formatting = null_ls.builtins.formatting
      local diagnostics = null_ls.builtins.diagnostics

      null_ls.setup({
        sources = {
          diagnostics.checkmake,
          formatting.stylua,
          require("none-ls.formatting.ruff").with({ extra_args = { "--extend-select", "I" } }),
          require("none-ls.formatting.ruff_format"),
          formatting.prettier.with({
            filetypes = { "html", "json", "yaml", "markdown" },
            formatting.prettier.with({
              filetypes = { "html", "json", "yaml", "markdown" },
              extra_args = { "--use-tabs", "false", "--tab-width", "2" }, -- Assuming you want 2 spaces here as well
            }),
          }),
          formatting.shfmt.with({ args = { "-i", "4" } }),
        },
      })
      -- Keybinding for manual formatting
      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format buffer" })
    end,
  },
}
