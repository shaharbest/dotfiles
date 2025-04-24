return {
  "vimwiki/vimwiki",
  init = function()
    local data_home = os.getenv("XDG_DATA_HOME") or vim.fn.expand("~/.local/share")
    vim.g.vimwiki_list = {{
      path = data_home .. "/vimwiki",
      syntax = "markdown",
      ext = ".md",
    }}
    vim.g.vimwiki_global_ext = 0
  end,
}
