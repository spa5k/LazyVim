-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  vim.o.guifont = "MonoLisaStatic Nerd Font,JetBrainsMono Nerd Font Mono:h14"
  vim.g.neovide_refresh_rate = 120
  vim.g.neovide_cursor_vfx_mode = "railgun"
end
