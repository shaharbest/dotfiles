# Neovim Configuration

Personal Neovim configuration built on [lazy.nvim](https://github.com/folke/lazy.nvim) for TypeScript/JavaScript, Lua, and Python development.

## Structure

```
init.lua                  # Vim options, diagnostics, autocmds
lua/config/lazy.lua       # lazy.nvim bootstrap
lua/config/keymaps.lua    # Global keymaps
lua/plugins/              # Plugin specs (one file per plugin/group)
```

## Plugins

| Plugin | Purpose |
|--------|---------|
| **catppuccin** | Colorscheme (mocha) |
| **nvim-cmp** | Completion (LSP, buffer, path, snippets) |
| **mason + mason-lspconfig** | LSP server management |
| **nvim-lspconfig** | LSP configuration |
| **Telescope** | Fuzzy finder, LSP references/definitions, git |
| **Oil.nvim** | File browser |
| **Neo-tree** | Tree file explorer (`<C-n>`) |
| **Harpoon v2** | Quick file switching |
| **Treesitter** | Indentation and folding (highlight disabled) |
| **gitsigns** | Inline git changes |
| **Neogit** | Git UI |
| **LazyGit** | Terminal git UI |
| **actions-preview** | Code action preview via Telescope |
| **alpha-nvim** | Dashboard |
| **peek.nvim** | Markdown preview (requires Deno) |
| **vim-dadbod** | Database (disabled) |

## LSP Servers

Managed by Mason: `pyright`, `ruff`, `lua_ls`, `ts_ls`

Additional servers can be manually installed: `cssls`, `biome`, `tailwindcss`, `emmet_language_server`, `prismals`

## Keybindings

Leader: `<Space>`

### File Navigation

| Key | Action |
|-----|--------|
| `<leader>f` | Find files |
| `<leader>g` | Live grep |
| `<leader>b` | Buffers |
| `<leader>e` | Oil file browser |
| `<leader>a` | Alternate file |
| `<C-n>` | Toggle Neo-tree |
| `<C-f>` | Open current directory |

### Harpoon

| Key | Action |
|-----|--------|
| `<leader>ha` | Add file |
| `<leader>he` | Toggle menu |
| `<leader>h1-4` | Jump to file 1-4 |
| `<leader>hp/hn` | Previous/next file |

### LSP

| Key | Action |
|-----|--------|
| `<leader>lf` | Format buffer |
| `<leader>rn` | Rename symbol |
| `<leader>sa` | Code actions |
| `<leader>sr` | LSP references |
| `<leader>sd` | LSP definitions |
| `<leader>dd` | Toggle diagnostics |
| `<leader>q` | Diagnostics to loclist |

### Git

| Key | Action |
|-----|--------|
| `<leader>lg` | LazyGit |
| `<leader>gg` | Neogit |
| `]c` / `[c` | Next/prev git hunk |
| `<leader>sc` | Git buffer commits |
| `<leader>sg` | Git status |

### Misc

| Key | Action |
|-----|--------|
| `<leader>v` | Edit init.lua |
| `<leader>z` | Edit .zshrc |
| `<leader>o` | Source current file |
| `<leader>O` | Restart Neovim |
| `<leader>w` | Save file |
| `<leader>cp` | Copy relative path |
| `<leader>hh` | Clear search highlight |
| `<leader>c` | First spell suggestion |
| `<leader>mp` | Markdown preview |
| `<C-k/j/h/l>` | Window navigation |
| `<M-n/e/i/m>` | Resize splits |

## Setup

1. Clone to `~/.config/nvim`
2. Open Neovim -- lazy.nvim auto-installs on first launch
3. Run `:Lazy sync` to install plugins
4. Run `:Mason` to verify LSP servers
