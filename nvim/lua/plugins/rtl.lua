return {
  "yever/rtl.vim",
  config = function()
    vim.g.rtl_toggle_key = "<F2>"
    vim.g.rtl_keymap = "hebrew"
    vim.api.nvim_set_keymap('n', '<F2>', ':call ToggleRTL()<CR>', { noremap = true, silent = true })
  end
}
