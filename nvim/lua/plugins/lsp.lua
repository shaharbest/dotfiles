return {
  -- Mason setup
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },

  -- mason-lspconfig setup for automatic installation of language servers
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = { auto_install = true },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "bashls",
          "html",
          "jsonls",
          "lua_ls",
          "ts_ls",
          "yamlls",
        },
        automatic_installation = true, -- Install automatically
      })
    end,
  },

  -- nvim-lspconfig setup
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")

      -- Define a table of language servers and their configurations
      local servers = {
        ts_ls = {
          filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
          root_dir = lspconfig.util.root_pattern(".meteor", "package.json", ".git"),
          init_options = { preferences = { disableSuggestions = false } },
        },
        jsonls = {},
        bashls = {},
        yamlls = {},
        html = {},
        lua_ls = {},
      }

      -- Setup all the servers dynamically
      for server, config in pairs(servers) do
        lspconfig[server].setup({
          capabilities = capabilities,
          opts = config,
        })
      end

      -- Set key mappings for common LSP actions
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, {})

      -- Diagnostic key mappings
      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {})
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {})
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {})
      vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, {})
    end,
  },

  -- null-ls for formatting
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.stylua,
        },
      })
      -- Keybinding for manual formatting
      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
  },

  -- mason-null-ls setup for installing Prettier and Stylua
  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = { "williamboman/mason.nvim", "nvimtools/none-ls.nvim" },
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = { "prettier", "stylua" },
        automatic_installation = true,
      })
    end,
  },
}
