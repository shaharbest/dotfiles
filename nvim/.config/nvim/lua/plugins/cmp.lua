return {
  "saghen/blink.cmp",
  version = "1.*",
  event = "InsertEnter",
  opts = {
    keymap = {
      preset = "super-tab",
      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-e>"] = { "hide", "fallback" },
      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
    },
    completion = {
      documentation = { auto_show = true },
      menu = { border = "rounded" },
    },
    signature = { enabled = true, window = { border = "rounded" } },
    cmdline = { enabled = true },
  },
}
