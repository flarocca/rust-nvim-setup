return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "ThePrimeagen/harpoon",
        "nvim-lua/plenary.nvim",
        "joshmedeski/telescope-smart-goto.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
        "debugloop/telescope-undo.nvim",
        "andrew-george/telescope-themes",
        "nvim-tree/nvim-web-devicons",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = vim.fn.executable "make" == 1,
        },
    },
    config = function()
        -- vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
        -- vim.keymap.set(
        --     "n",
        --     "<leader>fg",
        --     "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
        --     { desc = "Live Grep" }
        -- )
        -- vim.keymap.set(
        --     "n",
        --     "<leader>fc",
        --     '<cmd>lua require("telescope.builtin").live_grep({ glob_pattern = "!{spec,test}"})<CR>',
        --     { desc = "Live Grep Code" }
        -- )
        -- vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
        -- vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help Tags" })
        -- vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Find Symbols" })
        -- vim.keymap.set("n", "<leader>fi", "<cmd>AdvancedGitSearch<CR>", { desc = "Advanced Git Search" })
        -- vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Find Old Files" })
        -- vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Find Word under Cursor" })
        -- vim.keymap.set("n", "<leader>fgc", builtin.git_commits, { desc = "Search Git Commits" })
        -- vim.keymap.set("n", "<leader>fgb", builtin.git_bcommits, { desc = "Search Git Commits for Buffer" })
        -- vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find Keymaps" })
        -- vim.keymap.set("n", "<leader>/", function()
        --     -- You can pass additional configuration to telescope to change theme, layout, etc.
        --     require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
        --         winblend = 10,
        --         previewer = false,
        --         layout_config = { width = 0.7 },
        --     })
        -- end, { desc = "[/] Fuzzily search in current buffer" })

        local telescope = require "telescope"
        -- local telescopeConfig = require "telescope.config"

        -- Clone the default Telescope configuration
        -- local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

        -- I want to search in hidden/dot files.
        -- table.insert(vimgrep_arguments, "--hidden")
        -- -- I don't want to search in the `.git` directory.
        -- table.insert(vimgrep_arguments, "--glob")
        -- table.insert(vimgrep_arguments, "!**/.git/*")

        -- local actions = require "telescope.actions"

        -- local select_one_or_multi = function(prompt_bufnr)
        --     local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
        --     local multi = picker:get_multi_selection()
        --     if not vim.tbl_isempty(multi) then
        --         require("telescope.actions").close(prompt_bufnr)
        --         for _, j in pairs(multi) do
        --             if j.path ~= nil then
        --                 vim.cmd(string.format("%s %s", "edit", j.path))
        --             end
        --         end
        --     else
        --         require("telescope.actions").select_default(prompt_bufnr)
        --     end
        -- end

        telescope.setup {
            defaults = {
                path_display = { "truncate" },
                sorting_strategy = "ascending",
                layout_config = {
                    horizontal = {
                        width = 0.8,
                        height = 0.7,
                        prompt_position = "top",
                    },
                },
                -- sorting_strategy = "ascending",
                winblend = 10,
                prompt_prefix = "🔍 ",
                selection_caret = " ",
                -- mappings = {
                --     n = {
                --         ["<C-w>"] = actions.send_selected_to_qflist + actions.open_qflist,
                --     },
                --     i = {
                --         ["<C-j>"] = actions.cycle_history_next,
                --         ["<C-k>"] = actions.cycle_history_prev,
                --         ["<CR>"] = select_one_or_multi,
                --         ["<C-w>"] = actions.send_selected_to_qflist + actions.open_qflist,
                --         ["<C-S-d>"] = actions.delete_buffer,
                --         ["<C-s>"] = actions.cycle_previewers_next,
                --         ["<C-a>"] = actions.cycle_previewers_prev,
                --     },
                -- },
            },
            pickers = {
                find_files = {
                    -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
                    find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
                },
            },
            extensions = {
                -- persisted = { layout_config = { width = 0.55, height = 0.55 } },
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
                -- undo = {
                --     use_delta = true,
                --     use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo '$DIFF' | delta" }
                --     side_by_side = false,
                --     vim_diff_opts = { ctxlen = vim.o.scrolloff },
                --     entry_format = "state #$ID, $STAT, $TIME",
                --     mappings = {
                --         i = {
                --             ["<C-cr>"] = require("telescope-undo.actions").yank_additions,
                --             ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
                --             ["<cr>"] = require("telescope-undo.actions").restore,
                --         },
                --     },
                -- },
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown {
                        -- even more opts
                    },

                    -- pseudo code / specification for writing custom displays, like the one
                    -- for "codeactions"
                    -- specific_opts = {
                    --   [kind] = {
                    --     make_indexed = function(items) -> indexed_items, width,
                    --     make_displayer = function(widths) -> displayer
                    --     make_display = function(displayer) -> function(e)
                    --     make_ordinal = function(e) -> string
                    --   },
                    --   -- for example to disable the custom builtin "codeactions" display
                    --      do the following
                    --   codeactions = false,
                    -- }
                },
            },
        }

        -- require("telescope").load_extension "neoclip"

        require("telescope").load_extension "fzf"
        require("telescope").load_extension "ui-select"
        require("telescope").load_extension "themes"
        -- vim.g.zoxide_use_select = true
        -- require("telescope").load_extension "undo"
        -- require("telescope").load_extension "advanced_git_search"
        -- require("telescope").load_extension "live_grep_args"
        -- require("telescope").load_extension "colors"
        -- require("telescope").load_extension "noice"
    end,
}
