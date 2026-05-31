local function load_omarchy()
  local path = vim.env.HOME .. '/.config/omarchy/current/theme/neovim.lua'
  local ok, specs = pcall(dofile, path)
  if not ok or type(specs) ~= 'table' then return nil end

  local plugin, colorscheme = nil, nil
  for _, s in ipairs(specs) do
    if s[1] == 'LazyVim/LazyVim' then
      colorscheme = s.opts and s.opts.colorscheme
    else
      plugin = s
    end
  end
  if not plugin or not colorscheme then return nil end

  if not plugin.config then
    local opts = plugin.opts
    local mod = plugin.name or plugin[1]:match('[^/]+$'):gsub('%.nvim$', '')
    plugin.opts = nil
    plugin.priority = plugin.priority or 1000
    plugin.config = function()
      if opts then pcall(function() require(mod).setup(opts) end) end
      vim.cmd.colorscheme(colorscheme)
    end
  end

  return plugin
end

return load_omarchy() or {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    vim.cmd.colorscheme('catppuccin')
  end,
}
