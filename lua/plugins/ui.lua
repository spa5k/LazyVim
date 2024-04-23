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
    }
}
