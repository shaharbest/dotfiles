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
        "terraformls",
        "cssls",
      },
    },
    config = function(_, opts)
      -- terraform-ls sends overflowed unsigned delta values in semanticTokens
      -- causing nvim to spin at 100% CPU. Disable until upstream is fixed.
      vim.api.nvim_create_autocmd("LspAttach", {
        pattern = { "*.tf", "*.tfvars" },
        callback = function(ev)
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          if client and client.name == "terraformls" then
            client.server_capabilities.semanticTokensProvider = nil
          end
        end,
      })

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
