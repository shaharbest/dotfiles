return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "hrsh7th/cmp-buffer", lazy = true },
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
  },
  opts = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    return {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.locally_jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),

      -- Better source ordering: LSP first, buffer last with keyword_length to reduce noise
      sources = cmp.config.sources({
        { name = "nvim_lsp", priority = 1000 },
        { name = "path", priority = 250 },
        { name = "luasnip", priority = 100 },
        { name = "buffer", priority = 50, keyword_length = 3 },
      }),

      -- Simplified formatting
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, item)
          local source_names = {
            nvim_lsp = "[LSP]",
            luasnip = "[Snip]",
            buffer = "[Buf]",
            path = "[Path]",
          }
          item.menu = source_names[entry.source.name]
          return item
        end,
      },

      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
    }
  end,

  config = function(_, opts)
    local cmp = require("cmp")
    cmp.setup(opts)

    -- Cmdline completion
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = { { name = "buffer" } },
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources(
        { { name = "path" } },
        { { name = "cmdline" } }
      ),
    })
  end,
}
