vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.g.mapleader = " "

vim.opt.swapfile = false

vim.wo.number = true

vim.opt.clipboard = 'unnamedplus'

vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldenable = true
vim.o.foldlevel = 99 -- Start with all folds open

-- plugins/lsp.lua or wherever your LSP is configured
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local bufnr = args.buf
    local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")

    -- Only override for markdown
    if ft == "markdown" then
      vim.bo[bufnr].formatexpr = ""
      vim.bo[bufnr].textwidth = 80
    end
  end,
})
