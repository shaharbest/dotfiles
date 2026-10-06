-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")

-- Allow the volume keys to boost above 100% (PipeWire software amplification,
-- up to 150%), since the default omarchy-audio-output-volume hard-caps at 100.
-- See ~/.local/bin/omarchy-volume-boost.
hl.unbind("XF86AudioRaiseVolume")
hl.unbind("XF86AudioLowerVolume")
hl.unbind("ALT + XF86AudioRaiseVolume")
hl.unbind("ALT + XF86AudioLowerVolume")

o.bind("XF86AudioRaiseVolume", "Volume up", "omarchy-volume-boost raise", { locked = true, repeating = true })
o.bind("XF86AudioLowerVolume", "Volume down", "omarchy-volume-boost lower", { locked = true, repeating = true })
o.bind("ALT + XF86AudioRaiseVolume", "Volume up precise", "omarchy-volume-boost +1", { locked = true, repeating = true })
o.bind("ALT + XF86AudioLowerVolume", "Volume down precise", "omarchy-volume-boost -1", { locked = true, repeating = true })

-- Toggle espanso's expansion engine on/off (state tracked by
-- ~/.local/bin/omarchy-toggle-espanso, since espanso itself has no query command).
o.bind_toggle("SUPER + CTRL + M", "Toggle espanso", "espanso")

-- Open espanso's match search bar — S for snippets (it replaced the old
-- snippet-insert picker on this same key; the default here was Google Maps,
-- now removed). Replaces espanso's own built-in ALT+SPACE search_shortcut
-- (disabled in espanso's config) so this is the one discoverable, documented
-- way to trigger it (shows up in Super+K).
hl.unbind("SUPER + SHIFT + S")
o.bind("SUPER + SHIFT + S", "Espanso: search snippets", "espanso cmd search")

-- Two WhatsApp accounts, each with its own isolated browser profile so both
-- stay logged in independently. Replaces the default single WhatsApp bind.
hl.unbind("SUPER + SHIFT + ALT + G")
o.bind("SUPER + SHIFT + ALT + G", "WhatsApp Israeli", { webapp = "https://web.whatsapp.com/", focus = true })
o.bind("SUPER + SHIFT + ALT + U", "WhatsApp American",
  "omarchy-launch-webapp https://web.whatsapp.com/ --user-data-dir=" .. os.getenv("HOME") .. "/.local/share/webapps/whatsapp-american")

-- Preinstalled apps/web apps that were removed (2026-10-06) because they
-- were never used — unbind their default keys so the slots are free.
hl.unbind("SUPER + SHIFT + ALT + A") -- Grok
hl.unbind("SUPER + SHIFT + X")       -- X
hl.unbind("SUPER + SHIFT + ALT + X") -- X Post
hl.unbind("SUPER + SHIFT + P")       -- Google Photos
hl.unbind("SUPER + SHIFT + E")       -- HEY Email
hl.unbind("SUPER + SHIFT + ALT + E") -- HEY New email
hl.unbind("SUPER + SHIFT + C")       -- HEY Calendar
hl.unbind("SUPER + SHIFT + A")       -- ChatGPT
hl.unbind("SUPER + SHIFT + Y")       -- YouTube
hl.unbind("SUPER + SHIFT + O")       -- Obsidian
hl.unbind("SUPER + SHIFT + W")       -- Omawrite
hl.unbind("SUPER + SHIFT + M")       -- Spotify
hl.unbind("SUPER + SHIFT + ALT + M") -- Music TUI (cliamp)

-- Work email (Blvd, Microsoft 365). Reuses the old HEY Email slot.
o.bind("SUPER + SHIFT + E", "Outlook (work)", { webapp = "https://outlook.office.com/mail/", focus = true })

-- Passwords: Omarchy's slot for the password manager (1Password by default,
-- not installed here) opens a pass(1) picker instead. See ~/.local/bin/pass-menu.
hl.unbind("SUPER + SHIFT + SLASH")
o.bind("SUPER + SHIFT + SLASH", "Passwords", "pass-menu")
