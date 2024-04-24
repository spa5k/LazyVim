return {
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        opts = { options = vim.opt.sessionoptions:get() },
        -- stylua: ignore
        keys = {
            { "<leader>qs", function() require("persistence").load() end,                desc = "Restore Session" },
            { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
            { "<leader>qd", function() require("persistence").stop() end,                desc = "Don't Save Current Session" },
            { "<leader>qw", function() require("persistence").save() end,                desc = "Save Session" },
        },
    },
    {
        "ahmedkhalf/project.nvim",
        opts = {
            manual_mode = false,
        },
        event = "VeryLazy",
        config = function(_, opts)
            require("project_nvim").setup(opts)
            LazyVim.on_load("telescope.nvim", function()
                require("telescope").load_extension("projects")
            end)
        end,
        keys = {
            { "<leader>fp", "<Cmd>Telescope projects<CR>", desc = "Projects" },
        },
    }
}
