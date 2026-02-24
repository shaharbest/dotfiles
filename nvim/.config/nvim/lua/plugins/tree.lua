return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    ensure_installed = { "lua", "typescript", "tsx", "javascript", "json", "css", "html", "yaml", "markdown", "prisma", "hcl", "terraform", },
    highlight = {
      enable = false,
      disable = function(lang, buf)
        local max_filesize = 100 * 1024   -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
    },
    indent = { enable = true },
    -- incremental_selection = { enable = true },
    -- textobjects = { enable = true },
    fold = { enable = true },
  },
  -- config = function(_, opts) require("nvim-treesitter.configs").setup(opts) end,
}
