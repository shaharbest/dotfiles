return {
  "vimwiki/vimwiki",
  -- enabled = false,
  init = function()
    local home = vim.fn.expand("~")
    vim.g.vimwiki_list = {{
      path = home .. "/docs/vimwiki",
      syntax = "markdown",
      ext = ".md",
    }}
    vim.g.vimwiki_global_ext = 0
  end,
}
