return {
    -- change some telescope options and a keymap to browse plugin files
    {
        "nvim-telescope/telescope.nvim",
        keys = {
            -- add a keymap to browse plugin files
            -- stylua: ignore
            -- {
            --     "<leader>fp",
            --     function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
            --     desc = "Find Plugin File",
            -- },
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
            -- ctrl + shift + p for available commands
            { "<C-S-p>",    "<Cmd>Telescope commands<CR>", desc = "Search [C]ommands" },
        },
        dependencies = {
            'nvim-telescope/telescope-ui-select.nvim',
            'kkharji/sqlite.lua',
            'nvim-telescope/telescope-frecency.nvim',
            { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
        },
        config = function(_, opts)
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            local trouble = require("trouble.sources.telescope")
            local icons = require("config.icons")

            vim.api.nvim_create_autocmd("FileType", {
                pattern = "TelescopeResults",
                callback = function(ctx)
                    vim.api.nvim_buf_call(ctx.buf, function()
                        vim.fn.matchadd("TelescopeParent", "\t\t.*$")
                        vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
                    end)
                end,
            })
            local function formattedName(_, path)
                local tail = vim.fs.basename(path)
                local parent = vim.fs.dirname(path)
                if parent == "." then
                    return tail
                end
                return string.format("%s\t\t%s", tail, parent)
            end
            telescope.setup({
                file_ignore_patterns = { "%.git/." },
                -- borderchars = { "█", " ", "▀", "█", "█", " ", " ", "▀" },
                defaults = {
                    mappings = {
                        i = {
                            ["<esc>"] = actions.close,
                            ["<C-t>"] = trouble.open,
                        },

                        n = { ["<C-t>"] = trouble.open },
                    },
                    previewer = false,
                    prompt_prefix = " " .. icons.ui.Telescope .. " ",
                    selection_caret = icons.ui.BoldArrowRight .. " ",
                    file_ignore_patterns = { "node_modules", "package-lock.json" },
                    initial_mode = "insert",
                    select_strategy = "reset",
                    sorting_strategy = "ascending",
                    color_devicons = true,
                    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
                    layout_config = {
                        prompt_position = "top",
                        preview_cutoff = 120,
                    },
                    vimgrep_arguments = {
                        "rg",
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--smart-case",
                        "--hidden",
                        "--glob=!.git/",
                    },
                },
                pickers = {

                }
                --     find_files = {
                --         previewer = true,
                --         path_display = formattedName,
                --         layout_config = {
                --             height = 0.4,
                --             prompt_position = "top",
                --             preview_cutoff = 120,
                --         },
                --     },
                --     git_files = {
                --         previewer = false,
                --         path_display = formattedName,
                --         layout_config = {
                --             height = 0.4,
                --             prompt_position = "top",
                --             preview_cutoff = 120,
                --         },
                --     },
                --     buffers = {
                --         path_display = formattedName,
                --         mappings = {
                --             i = {
                --                 ["<c-d>"] = actions.delete_buffer,
                --             },
                --             n = {
                --                 ["<c-d>"] = actions.delete_buffer,
                --             },
                --         },
                --         previewer = true,
                --         initial_mode = "normal",
                --         -- theme = "dropdown",
                --         layout_config = {
                --             height = 0.4,
                --             width = 0.6,
                --             prompt_position = "top",
                --             preview_cutoff = 120,
                --         },
                --     },
                --     current_buffer_fuzzy_find = {
                --         previewer = true,
                --         layout_config = {
                --             prompt_position = "top",
                --             preview_cutoff = 120,
                --         },
                --     },
                --     live_grep = {
                --         only_sort_text = true,
                --         previewer = true,
                --     },
                --     grep_string = {
                --         only_sort_text = true,
                --         previewer = true,
                --     },
                --     lsp_references = {
                --         show_line = false,
                --         previewer = true,
                --     },
                --     treesitter = {
                --         show_line = false,
                --         previewer = true,
                --     },
                --     colorscheme = {
                --         enable_preview = true,
                --     },
                -- },
                -- extensions = {
                --     fzf = {
                --         fuzzy = true,                   -- false will only do exact matching
                --         override_generic_sorter = true, -- override the generic sorter
                --         override_file_sorter = true,    -- override the file sorter
                --         case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                --     },
                --     ["ui-select"] = {
                --         require("telescope.themes").get_dropdown({
                --             previewer = true,
                --             initial_mode = "normal",
                --             sorting_strategy = "ascending",
                --             layout_strategy = "horizontal",
                --             layout_config = {
                --                 horizontal = {
                --                     width = 0.5,
                --                     height = 0.4,
                --                     preview_width = 0.6,
                --                 },
                --             },
                --         }),
                --     },
                --     frecency = {
                --         default_workspace = "CWD",
                --         show_scores = true,
                --         show_unindexed = true,
                --         disable_devicons = false,
                --         ignore_patterns = {
                --             "*.git/*",
                --             "*/tmp/*",
                --             "*/lua-language-server/*",
                --         },
                --     },
                -- },
            })
            telescope.load_extension("fzf")
            telescope.load_extension("ui-select")
            -- telescope.load_extension("refactoring")
            telescope.load_extension("frecency")
            telescope.load_extension("notify")
            -- ui select
            telescope.load_extension("ui-select")
        end,
    },
}
