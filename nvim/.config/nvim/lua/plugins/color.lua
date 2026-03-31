local function read_theme()
  local f = io.open(vim.env.HOME .. '/.config/theme', 'r')
  if not f then return 'dark' end
  local t = f:read('*l')
  f:close()
  return t or 'dark'
end

local function apply_theme(mode)
  local flavour = mode == 'light' and 'latte' or 'mocha'
  require('catppuccin').setup({
    compile = { enabled = true },
    flavour = flavour,
    term_colors = true,
    styles = { comments = { 'italic' }, conditionals = { 'italic' } },
    integrations = { cmp = true },
  })
  vim.cmd.colorscheme('catppuccin')
  local f = io.open(vim.env.HOME .. '/.config/theme', 'w')
  if f then f:write(mode); f:close() end
end

return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    apply_theme(read_theme())
    vim.api.nvim_create_user_command('Theme', function(args)
      apply_theme(args.args)
    end, { nargs = 1 })
  end,
}
