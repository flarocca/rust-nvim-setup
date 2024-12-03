return {
    -- {
    --     "lewis6991/gitsigns.nvim",
    --     event = "BufReadPre",
    --     config = function()
    --         require("gitsigns").setup()

    --         vim.api.nvim_set_hl(0, 'GitSignsAdd', { link = 'GitSignsAdd' })
    --         vim.api.nvim_set_hl(0, 'GitSignsAddLn', { link = 'GitSignsAddLn' })
    --         vim.api.nvim_set_hl(0, 'GitSignsAddNr', { link = 'GitSignsAddNr' })
    --         vim.api.nvim_set_hl(0, 'GitSignsChange', { link = 'GitSignsChange' })
    --         vim.api.nvim_set_hl(0, 'GitSignsChangeLn', { link = 'GitSignsChangeLn' })
    --         vim.api.nvim_set_hl(0, 'GitSignsChangeNr', { link = 'GitSignsChangeNr' })
    --         vim.api.nvim_set_hl(0, 'GitSignsChangedelete', { link = 'GitSignsChange' })
    --         vim.api.nvim_set_hl(0, 'GitSignsChangedeleteLn', { link = 'GitSignsChangeLn' })
    --         vim.api.nvim_set_hl(0, 'GitSignsChangedeleteNr', { link = 'GitSignsChangeNr' })
    --         vim.api.nvim_set_hl(0, 'GitSignsDelete', { link = 'GitSignsDelete' })
    --         vim.api.nvim_set_hl(0, 'GitSignsDeleteLn', { link = 'GitSignsDeleteLn' })
    --         vim.api.nvim_set_hl(0, 'GitSignsDeleteNr', { link = 'GitSignsDeleteNr' })
    --         vim.api.nvim_set_hl(0, 'GitSignsTopdelete', { link = 'GitSignsDelete' })
    --         vim.api.nvim_set_hl(0, 'GitSignsTopdeleteLn', { link = 'GitSignsDeleteLn' })
    --         vim.api.nvim_set_hl(0, 'GitSignsTopdeleteNr', { link = 'GitSignsDeleteNr' })
    --         vim.api.nvim_set_hl(0, 'GitSignsUntracked', { link = 'GitSignsAdd' })
    --         vim.api.nvim_set_hl(0, 'GitSignsUntrackedLn', { link = 'GitSignsAddLn' })
    --         vim.api.nvim_set_hl(0, 'GitSignsUntrackedNr', { link = 'GitSignsAddNr' })
    --         -- {
    --         --     signs = {
    --         --         add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    --         --         change = {
    --         --             hl = "GitSignsChange",
    --         --             text = "│",
    --         --             numhl = "GitSignsChangeNr",
    --         --             linehl = "GitSignsChangeLn",
    --         --         },
    --         --         delete = {
    --         --             hl = "GitSignsDelete",
    --         --             text = "_",
    --         --             numhl = "GitSignsDeleteNr",
    --         --             linehl = "GitSignsDeleteLn",
    --         --         },
    --         --         topdelete = {
    --         --             hl = "GitSignsDelete",
    --         --             text = "‾",
    --         --             numhl = "GitSignsDeleteNr",
    --         --             linehl = "GitSignsDeleteLn",
    --         --         },
    --         --         changedelete = {
    --         --             hl = "GitSignsChange",
    --         --             text = "~",
    --         --             numhl = "GitSignsChangeNr",
    --         --             linehl = "GitSignsChangeLn",
    --         --         },
    --         --         untracked = { hl = "GitSignsAdd", text = "┆", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    --         --     },
    --         -- }
    --     end,
    -- },
    -- {
    --     "SuperBo/fugit2.nvim",
    --     lazy = false,
    --     opts = {
    --         width = 100,
    --         external_diffview = true,
    --         libgit2_path = "/opt/homebrew/lib/libgit2.dylib",
    --     },
    --     dependencies = {
    --         "MunifTanjim/nui.nvim",
    --         "lewis6991/gitsigns.nvim",
    --         "nvim-tree/nvim-web-devicons",
    --         "nvim-lua/plenary.nvim",
    --         "sindrets/diffview.nvim", -- Aquí agregamos diffview.nvim
    --         {
    --             "chrisgrieser/nvim-tinygit", -- Opcional: para vista de PRs en GitHub
    --             dependencies = { "stevearc/dressing.nvim" },
    --         },
    --     },
    --     cmd = { "Fugit2", "Fugit2Diff", "Fugit2Graph" },
    -- },
    {
        "f-person/git-blame.nvim",
        lazy = false,
        config = function()
            vim.g.gitblame_enabled = 0
            vim.cmd "GitBlameDisable"
            vim.g.gitblame_delay = 50
        end,
    },
    {
        "sindrets/diffview.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = {
            enhanced_diff_hl = true, -- Opcional: mejora el resaltado del diff
        },
        cmd = {
            "DiffviewOpen",
            "DiffviewClose",
            "DiffviewToggleFiles",
            "DiffviewFocusFiles",
        },
    },
}
