return {
  -- EditorConfig support (shared between VS Code and Neovim)
  {
    "gpanders/editorconfig.nvim",
    lazy = false,
  },

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
      },
      automatic_installation = true,
    },
  },

  -- nvim-lspconfig setup
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      local servers = {
        bashls = {},
        html = {},
        jsonls = {},
        lua_ls = {},
        ts_ls = {
          filetypes = {
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx",
          },
          root_dir = lspconfig.util.root_pattern("package.json", ".git"),
        },
        yamlls = {},
        tailwindcss = {
          filetypes = {
            "html",
            "css",
            "scss",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
          },
          root_dir = lspconfig.util.root_pattern("tailwind.config.js", "tailwind.config.cjs", "package.json", ".git"),
          settings = {
            tailwindCSS = {
              experimental = {
                classRegex = { "[\"'`]([^\"'`]*).*?[\"'`]" }, -- Improves class detection in JSX/TSX
              },
            },
          },
        },
      }

      for server, config in pairs(servers) do
        lspconfig[server].setup({
          capabilities = capabilities,
          settings = config.settings,
          filetypes = config.filetypes,
          root_dir = config.root_dir,
          init_options = config.init_options,
        })
      end

      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show documentation" })
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Show references" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
      vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, { desc = "Rename" })

      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostics" })
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
      vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Show diagnostics in quickfix" })

      -- Format on save for common formats
      -- vim.api.nvim_create_autocmd("BufWritePre", {
      --   pattern = {
      --     "*.ts",
      --     "*.tsx",
      --     "*.js",
      --     "*.jsx",
      --     "*.json",
      --     "*.css",
      --     "*.scss",
      --     "*.html",
      --     "*.yaml",
      --     "*.md",
      --   },
      --   callback = function()
      --     vim.lsp.buf.format({ async = false })
      --   end,
      -- })

      -- vim.api.nvim_create_autocmd("BufWritePre", {
      --   callback = function()
      --     vim.lsp.buf.format({ async = false })
      --   end,
      --   pattern = {
      --     "*.ts",
      --     "*.tsx",
      --     "*.js",
      --     "*.jsx",
      --     "*.json",
      --     "*.css",
      --     "*.md",
      --     "*.yaml",
      --   },
      -- })

      -- Optional: diagnostics config
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        update_in_insert = false,
        severity_sort = true,
      })

      -- Recommended diagnostic display settings
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        update_in_insert = false,
        severity_sort = true,
      })
    end,
  },

  -- null-ls for formatting and linting (via mason-null-ls)
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "jay-babu/mason-null-ls.nvim",
      "nvimtools/none-ls-extras.nvim", -- required for eslint_d
    },
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = {
          "eslint_d",
          "prettier",
        },
        automatic_installation = true,
      })

      local null_ls = require("null-ls")
      local eslint_d = require("none-ls.diagnostics.eslint_d")
      local eslint_d_format = require("none-ls.formatting.eslint_d")
      local prettier = null_ls.builtins.formatting.prettier

      null_ls.setup({
        sources = {
          eslint_d.with({
            condition = function(utils)
              return utils.root_has_file({
                ".eslintrc.js",
                ".eslintrc.json",
                "eslint.config.js",
              })
            end,
          }),
          eslint_d_format.with({
            condition = function(utils)
              return utils.root_has_file({
                ".eslintrc.js",
                ".eslintrc.json",
                "eslint.config.js",
              })
            end,
          }),
          prettier.with({
            condition = function(utils)
              return utils.root_has_file({
                ".prettierrc",
                ".prettierrc.js",
                "prettier.config.js",
                "package.json",
              })
            end,
            filetypes = {
              "javascript",
              "javascriptreact",
              "typescript",
              "typescriptreact",
              "json",
              "yaml",
              "markdown",
              "css",
              "scss",
              "html",
            },
          }),
        },
      })

      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format buffer" })
    end,
  },
}
