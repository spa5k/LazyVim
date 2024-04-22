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
            { "<leader>sp", "<Cmd>Telescope projects<CR>", desc = "[S]earch [P]rojects" },
        },
        dependencies = {
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                config = function()
                    require("telescope").load_extension("fzf")
                end,
            },
            { 'nvim-telescope/telescope-ui-select.nvim' },

            -- Useful for getting pretty icons, but requires a Nerd Font.
            { 'nvim-tree/nvim-web-devicons',            enabled = vim.g.have_nerd_font },
        },
        config = function(_, opts)
            require("telescope").setup {
                defaults = {
                    layout_config = {
                        width = 0.9,
                        height = 0.9,
                        horizontal = {
                            prompt_position = "top",
                            preview_width = 0.55,
                            results_width = 0.8,
                        },
                        vertical = {
                            mirror = false,
                        },
                    },
                    layout_strategy = "flex",
                    prompt_prefix = "❯ ",
                    selection_caret = "❯ ",
                    sorting_strategy = "ascending",
                    winblend = 10,
                },

                extensions = {
                    ['ui-select'] = {
                        require('telescope.themes').get_dropdown(),
                    },
                },
            }
        end,
    },


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
    {
        'petertriho/nvim-scrollbar',
        config = function()
            require('scrollbar').setup()
        end,
    },
    -- lewis6991/satellite.nvim
    -- {
    --     "lewis6991/satellite.nvim",
    --     opts = {}
    --     config = function()
    --         require('satellite').setup {

    --         }
    --     end
    -- }
}
