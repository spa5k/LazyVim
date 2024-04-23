return {
  -- editor config support
  {
    "editorconfig/editorconfig-vim",
  },
  {
    "ThePrimeagen/refactoring.nvim",
    enabled = false,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    config = function()
      require("refactoring").setup({})
    end,
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
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
    },
    keys = function()
      local keys = {
        {
          "<leader>H",
          function()
            require("harpoon"):list():add()
          end,
          desc = "Harpoon File",
        },
        {
          "<leader>h",
          function()
            local harpoon = require("harpoon")
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = "Harpoon Quick Menu",
        },
        {
          "<leader>a",
          function()
            require("harpoon"):list():add()
          end,
          desc = "Add to Harpoon List",
        },
        {
          "<C-h>",
          function()
            require("harpoon"):list():select(1)
          end,
          desc = "Select First Harpoon File",
        },
        {
          "<C-t>",
          function()
            require("harpoon"):list():select(2)
          end,
          desc = "Select Second Harpoon File",
        },
        {
          "<C-n>",
          function()
            require("harpoon"):list():select(3)
          end,
          desc = "Select Third Harpoon File",
        },
        {
          "<C-s>",
          function()
            require("harpoon"):list():select(4)
          end,
          desc = "Select Fourth Harpoon File",
        },
        {
          "<C-S-P>",
          function()
            require("harpoon"):list():prev()
          end,
          desc = "Select Previous Harpoon File",
        },
        {
          "<C-S-N>",
          function()
            require("harpoon"):list():next()
          end,
          desc = "Select Next Harpoon File",
        },
        {
          "<C-e>",
          function()
            local harpoon_files = require("harpoon"):list()
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
              table.insert(file_paths, item.value)
            end

            require("telescope.pickers")
                .new({}, {
                  prompt_title = "Harpoon",
                  finder = require("telescope.finders").new_table({
                    results = file_paths,
                  }),
                  previewer = require("telescope.config").values.file_previewer({}),
                  sorter = require("telescope.config").values.generic_sorter({}),
                })
                :find()
          end,
          desc = "Open Harpoon Window",
        },
      }

      for i = 1, 5 do
        table.insert(keys, {
          "<leader>" .. i,
          function()
            require("harpoon"):list():select(i)
          end,
          desc = "Harpoon to File " .. i,
        })
      end
      return keys
    end,
    config = function()
      local harpoon = require("harpoon")

      -- REQUIRED
      harpoon:setup()
      -- REQUIRED
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
        { "<A-j>",      ":MoveLine(1)<CR>",   desc = "Move line down" },
        { "<A-k>",      ":MoveLine(-1)<CR>",  desc = "Move line up" },
        { "<A-h>",      ":MoveHChar(-1)<CR>", desc = "Move character left" },
        { "<A-l>",      ":MoveHChar(1)<CR>",  desc = "Move character right" },
        { "<leader>wf", ":MoveWord(1)<CR>",   desc = "Move word forward" },
        { "<leader>wb", ":MoveWord(-1)<CR>",  desc = "Move word backward" },

        -- Visual-mode commands
        { "v",          "<A-j>",              ":MoveBlock(1)<CR>",          desc = "Move block down" },
        { "v",          "<A-k>",              ":MoveBlock(-1)<CR>",         desc = "Move block up" },
        { "v",          "<A-h>",              ":MoveHBlock(-1)<CR>",        desc = "Move block left" },
        { "v",          "<A-l>",              ":MoveHBlock(1)<CR>",         desc = "Move block right" },

        -- also make them work with arrow keys
        { "<A-Down>",   ":MoveLine(1)<CR>",   desc = "Move line down" },
        { "<A-Up>",     ":MoveLine(-1)<CR>",  desc = "Move line up" },
        { "<A-Left>",   ":MoveHChar(-1)<CR>", desc = "Move character left" },
        { "<A-Right>",  ":MoveHChar(1)<CR>",  desc = "Move character right" },
        { "v",          "<A-Down>",           ":MoveBlock(1)<CR>",          desc = "Move block down" },
        { "v",          "<A-Up>",             ":MoveBlock(-1)<CR>",         desc = "Move block up" },
        { "v",          "<A-Left>",           ":MoveHBlock(-1)<CR>",        desc = "Move block left" },
        { "v",          "<A-Right>",          ":MoveHBlock(1)<CR>",         desc = "Move block right" },
      }
      return keys
    end,
    config = function()
      require("move").setup({})
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    version = "*",
    opts = {},
    event = "LazyFile",
    enabled = true,
  },
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {},
    command = "Hardtime",
    event = "BufEnter",
    keys = {
      { "n", "j",  "<cmd>Hardtime<CR>", desc = "Hardtime" },
      { "n", "k",  "<cmd>Hardtime<CR>", desc = "Hardtime" },
      { "n", "gj", "<cmd>Hardtime<CR>", desc = "Hardtime" },
      { "n", "gk", "<cmd>Hardtime<CR>", desc = "Hardtime" },
    },
  },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup({
        stop_eof = true,
        easing_function = "sine",
        hide_cursor = true,
        cursor_scrolls_alone = true,
      })
    end,
  },
  {
    "numToStr/Comment.nvim",
    opts = {},
  },
}
