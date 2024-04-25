-- if true then return {} end

return {
  -- colorschemes area
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  -- add kanagawa
  { "rebelot/kanagawa.nvim" },
  -- add tokyonight
  { "folke/tokyonight.nvim" },
  -- add habamax
  { "ntk148v/habamax.nvim", dependencies = { "rktjmp/lush.nvim" } },
  -- add everforest
  { "sainnhe/everforest" },
  -- add nord
  { "shaunsingh/nord.nvim" },
  -- add onedark
  { "navarasu/onedark.nvim" },
  -- add sonokai
  { "sainnhe/sonokai" },
  -- add material
  { "marko-cerovac/material.nvim" },
  -- add catppuccino
  { "Pocco81/Catppuccino.nvim" },
  -- add iceberg
  { "cocopon/iceberg.vim" },
  -- add gruvbox-material
  { "sainnhe/gruvbox-material" },
  -- add rose-pine
  { "rose-pine/neovim", name = "rose-pine" },
  -- add miasma
  { "xero/miasma.nvim" },
  -- Configure LazyVim to load gruvbox
  -- {
  --     'petertriho/nvim-scrollbar',
  --     config = function()
  --         require('scrollbar').setup()
  --     end,
  -- },
  -- lewis6991/satellite.nvim
  {
    "lewis6991/satellite.nvim",
    opts = {},
    -- config = function()
    --     require('satellite').setup {

    --     }
    -- end
  },
  {
    "folke/zen-mode.nvim",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    "JManch/sunset.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("sunset").setup({
        latitude = 25.84, -- north is positive, south is negative
        longitude = 80.89, -- east is positive, west is negative
        day_callback = function()
          require("notify")("It's day time", "info")
          vim.cmd("colorscheme catppuccino-latte")
        end, -- function that is called when day begins
        night_callback = function()
          require("notify")("It's night time", "info")
          vim.cmd("colorscheme miasma")
        end,
        update_interval = 60000, -- how frequently to check for sunrise/sunset changes in milliseconds
        time_format = "%H:%M", -- sun time formatting using os.date https://www.lua.org/pil/22.1.html
      })
    end,
  },
}
