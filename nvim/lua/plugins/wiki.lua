return {
  "vimwiki/vimwiki",
  -- enabled = false,
  cmd = { "VimwikiIndex", "VimwikiMakeDiaryNote", "VimwikiDiaryIndex" },
  init = function()
    local home = vim.fn.expand("~")
    vim.g.vimwiki_list = {{
      path = home .. "/.local/share/vimwiki",
      syntax = "markdown",
      ext = ".md",
    }}
    vim.g.vimwiki_global_ext = 0

    vim.keymap.set("n", "<leader>ww", ":VimwikiIndex<CR>", { desc = "Open VimWiki index" })
  end,
}

