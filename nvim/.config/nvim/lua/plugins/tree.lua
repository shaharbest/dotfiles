return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  -- README: "This plugin does not support lazy-loading."
  lazy = false,
  config = function()
    vim.treesitter.language.register("terraform", "terraform-vars")

    require("nvim-treesitter").install({
      "lua", "typescript", "tsx", "javascript", "json", "css", "html",
      "yaml", "markdown", "prisma", "hcl", "terraform",
    })

    local max_filesize = 100 * 1024 -- 100 KB

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(ev)
        local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(ev.buf))
        if ok and stats and stats.size > max_filesize then
          return
        end
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
