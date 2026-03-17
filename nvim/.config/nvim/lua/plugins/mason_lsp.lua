return {
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate" },
    opts = {},
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      ensure_installed = {
        "pyright",
        "ruff",
        "lua_ls",
        "ts_ls",
        "eslint",
      },
    },
    config = function(_, opts)
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = { 'vim' } },
          }
        }
      })

      require("mason-lspconfig").setup(opts)
      -- automatic_enable is true by default, so servers will auto-attach

      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
    end,
  },
}
