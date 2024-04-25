return {
  -- editor config support
  {
    "editorconfig/editorconfig-vim",
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
    config = function()
      require("barbecue").setup({
        create_autocmd = false, -- prevent barbecue from updating itself automatically
      })

      vim.api.nvim_create_autocmd({
        "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
        "BufWinEnter",
        "CursorHold",
        "InsertLeave",

        -- include this if you have set `show_modified` to `true`
        -- "BufModifiedSet",
      }, {
        group = vim.api.nvim_create_augroup("barbecue.updater", {}),
        callback = function()
          require("barbecue.ui").update()
        end,
      })
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
  },
  {
    "fedepujol/move.nvim",
    opts = {},
    keys = function()
      local keys = {
        -- Normal-mode commands
        { "<A-j>", ":MoveLine(1)<CR>", desc = "Move line down" },
        { "<A-k>", ":MoveLine(-1)<CR>", desc = "Move line up" },
        { "<A-h>", ":MoveHChar(-1)<CR>", desc = "Move character left" },
        { "<A-l>", ":MoveHChar(1)<CR>", desc = "Move character right" },
        { "<leader>wf", ":MoveWord(1)<CR>", desc = "Move word forward" },
        { "<leader>wb", ":MoveWord(-1)<CR>", desc = "Move word backward" },

        -- Visual-mode commands
        { "v", "<A-j>", ":MoveBlock(1)<CR>", desc = "Move block down" },
        { "v", "<A-k>", ":MoveBlock(-1)<CR>", desc = "Move block up" },
        { "v", "<A-h>", ":MoveHBlock(-1)<CR>", desc = "Move block left" },
        { "v", "<A-l>", ":MoveHBlock(1)<CR>", desc = "Move block right" },

        -- also make them work with arrow keys
        { "<A-Down>", ":MoveLine(1)<CR>", desc = "Move line down" },
        { "<A-Up>", ":MoveLine(-1)<CR>", desc = "Move line up" },
        { "<A-Left>", ":MoveHChar(-1)<CR>", desc = "Move character left" },
        { "<A-Right>", ":MoveHChar(1)<CR>", desc = "Move character right" },
        { "v", "<A-Down>", ":MoveBlock(1)<CR>", desc = "Move block down" },
        { "v", "<A-Up>", ":MoveBlock(-1)<CR>", desc = "Move block up" },
        { "v", "<A-Left>", ":MoveHBlock(-1)<CR>", desc = "Move block left" },
        { "v", "<A-Right>", ":MoveHBlock(1)<CR>", desc = "Move block right" },
      }
      return keys
    end,
    config = function()
      require("move").setup({})
    end,
  },
  {
    "karb94/neoscroll.nvim",
    config = function()
      if not vim.g.neovide then
        require("neoscroll").setup({
          stop_eof = true,
          easing_function = "sine",
          hide_cursor = true,
          cursor_scrolls_alone = true,
        })
      end
    end,
  },
  {
    "numToStr/Comment.nvim",
    opts = {},
  },
  {
    "NStefan002/screenkey.nvim",
    cmd = "Screenkey",
    version = "*",
    config = true,
  },
}
