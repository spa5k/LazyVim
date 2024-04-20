-- Blazing fast minimap/scrollbar in Lua | https://github.com/echasnovski/mini.map/

return {
  {
    "echasnovski/mini.map",
    version = false,
    opts = {},
    config = function()
      require("mini.map").setup()
      local map = require("mini.map")
      map.setup({
        integrations = {
          map.gen_integration.builtin_search(),
          map.gen_integration.diagnostic({
            error = "DiagnosticFloatingError",
            warn = "DiagnosticFloatingWarn",
            info = "DiagnosticFloatingInfo",
            hint = "DiagnosticFloatingHint",
          }),
          map.gen_integration.gitsigns({
            add = "GitSignsAdd",
            change = "GitSignsChange",
            delete = "GitSignsDelete",
          }),
        },
        symbols = {
          encode = map.gen_encode_symbols.dot("3x2"),
        },
        window = {
          side = "right",
          width = 15, -- set to 1 for a pure scrollbar :)
          winblend = 15,
          show_integration_count = false,
        },
      })
    end,
    keys = {
      {
        "<leader>mc",
        function() MiniMap.close() end,
        desc = "Close MiniMap",
      },
      {
        "<leader>mf",
        function() MiniMap.toggle_focus() end,
        desc = "Toggle MiniMap Focus",
      },
      {
        "<leader>mo",
        function() MiniMap.open() end,
        desc = "Open MiniMap",
      },
      {
        "<leader>mr",
        function() MiniMap.refresh() end,
        desc = "Refresh MiniMap",
      },
      {
        "<leader>ms",
        function() MiniMap.toggle_side() end,
        desc = "Toggle MiniMap Side",
      },
      {
        "<leader>mt",
        function() MiniMap.toggle() end,
        desc = "Toggle MiniMap",
      },
    }
  },
}
