-- if true then return {} end

return {
    -- change some telescope options and a keymap to browse plugin files
    {
        "nvim-telescope/telescope.nvim",
        keys = {
            -- add a keymap to browse plugin files
            -- stylua: ignore
            {
                "<leader>fp",
                function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
                desc = "Find Plugin File",
            },
            -- vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Search Files [P]opup' })
            {
                "<C-p>",
                function() require("telescope.builtin").find_files() end,
                desc = "Search Files [P]opup",
            },
            {
                "<leader>/",
                function()
                    require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
                        winblend = 10,
                        previewer = false,
                    })
                end,
                desc = "[/] Fuzzily search in current buffer",
            },
        },
        dependencies = {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            config = function()
                require("telescope").load_extension("fzf")
            end,
        },
    },


    -- the opts function can also be used to change the default opts:
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = function(_, opts)
            table.insert(opts.sections.lualine_x, "😄")
        end,
    },

    -- or you can return new options to override all the defaults
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = function()
            return {
                --[[add your custom lualine config here]]
            }
        end,
    },

    -- use mini.starter instead of alpha
    -- { import = "lazyvim.plugins.extras.ui.mini-starter" },


    -- colorschemes area
    -- add gruvbox
    { "ellisonleao/gruvbox.nvim" },
    -- add kanagawa
    { "rebelot/kanagawa.nvim" },
    -- add tokyonight
    { "folke/tokyonight.nvim" },
    -- add habamax
    { "ntk148v/habamax.nvim",       dependencies = { "rktjmp/lush.nvim" } },
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


    -- Configure LazyVim to load gruvbox
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "gruvbox",
        },
    },
}
