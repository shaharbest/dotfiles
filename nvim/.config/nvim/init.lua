vim.cmd([[set mouse=]])
vim.cmd([[set noswapfile]])

vim.g.mapleader = " "
vim.o.winborder = "rounded"

vim.g.editorconfig = false

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
-- vim.opt.cindent = false
vim.opt.indentexpr = vim.treesitter.indent
vim.opt.number = true

vim.o.showtabline = 2
vim.o.signcolumn = "yes"
vim.o.wrap = false
vim.o.cursorcolumn = false
vim.o.ignorecase = true


-- vim.o.indentexpr = "v:lua.vim.treesitter.indent()"
vim.o.termguicolors = true
vim.o.undofile = true
vim.o.clipboard = 'unnamedplus'
vim.o.completeopt = 'menu,menuone,noselect'

vim.opt.foldcolumn = "0"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = ""
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

vim.diagnostic.config({ virtual_lines = true })
-- vim.diagnostic.enable(false)

-- Set markdown filetype for new empty/unnamed buffers
vim.api.nvim_create_autocmd({ "BufEnter", "BufNewFile" }, {
  pattern = "*",
  callback = function()
    if vim.bo.filetype == "" and vim.fn.bufname("%") == "" then
      vim.bo.filetype = "markdown"
    end
  end,
})

require("config.lazy")
require("config.keymaps")

