local map = vim.keymap.set

map({ "n", "v", "x" }, "<leader>v", "<Cmd>edit $MYVIMRC<CR>")
map({ "n", "v", "x" }, "<leader>z", "<Cmd>e ~/.config/zsh/.zshrc<CR>")
map({ "n", "v", "x" }, "<leader>n", ":norm ", { desc = "Enter norm command" })
map({ "n", "v", "x" }, "<leader>o", "<Cmd>source %<CR>")
map({ "n", "v", "x" }, "<leader>O", "<Cmd>restart<CR>")
-- map({ "n","v","x" }, "<C-s>", [[:s/\V]])
map({ "n", "v", "x" }, "<leader>lf", vim.lsp.buf.format)
map({ "v", "x", "n" }, "<C-y>", '"+y')
map({ "n" }, "<M-n>", "<cmd>resize +2<CR>")
map({ "n" }, "<M-e>", "<cmd>resize -2<CR>")
map({ "n" }, "<M-i>", "<cmd>vertical resize +5<CR>")
map({ "n" }, "<M-m>", "<cmd>vertical resize -5<CR>")
map({ "n" }, "<leader>e", "<cmd>Oil<CR>")
map({ "n" }, "<leader>c", "1z=")
map({ "n" }, "<C-q>", ":copen<CR>", { silent = true })
-- map({ "n" }, "<leader>w", "<Cmd>update<CR>")
map({ "n" }, "<leader>q", vim.diagnostic.setloclist)
map({ "n" }, "<leader>a", ":edit #<CR>")
map({ "n" }, "<leader>lg", ":LazyGit<CR>")

-- window navigation
map('n', '<c-k>', ':wincmd k<CR>')
map('n', '<c-j>', ':wincmd j<CR>')
map('n', '<c-h>', ':wincmd h<CR>')
map('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>hh', ':nohlsearch<CR>')

vim.keymap.set('n', '<leader>cp', ':let @+=expand("%:.")<CR>', { desc = 'Copy relative path' })

map("n", "<leader>dd", function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle diagnostics" })
