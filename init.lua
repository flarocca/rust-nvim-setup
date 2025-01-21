vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
    local repo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
    {
        "NvChad/NvChad",
        lazy = false,
        branch = "v2.5",
        import = "nvchad.plugins",
    },

    { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
    require "mappings"
end)

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup {
    view = {
        width = 50,
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    git = {
        enable = true,
        ignore = false,
        timeout = 500,
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
        -- debounce_delay = 50,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    actions = {
        expand_all = {
            exclude = {
                "out",
                "node_modules",
                "target",
                "build",
                ".git",
            },
        },
        change_dir = {
            enable = false,
        },
    },
    tab = {
        sync = {
            open = true,
            close = true,
            ignore = {},
        },
    },
    renderer = {
        root_folder_label = ":~:s?$?/?",
        special_files = {},
        highlight_git = true,
        highlight_diagnostics = true,
        highlight_modified = "all",
        indent_markers = {
            enable = true,
        },
        icons = {
            show = {
                folder_arrow = true,
            },
        },
    },
}

require("nvim-test").setup {
    run = true, -- run tests (using for debug)
    commands_create = true, -- create commands (TestFile, TestLast, ...)
    filename_modifier = ":.", -- modify filenames before tests run(:h filename-modifiers)
    silent = false, -- less notifications
    term = "terminal", -- a terminal to run ("terminal"|"toggleterm")
    termOpts = {
        direction = "vertical", -- terminal's direction ("horizontal"|"vertical"|"float")
        width = 96, -- terminal's width (for vertical|float)
        height = 24, -- terminal's height (for horizontal|float)
        go_back = false, -- return focus to original window after executing
        stopinsert = "auto", -- exit from insert mode (true|false|"auto")
        keep_one = true, -- keep only one terminal for testing
    },
    runners = { -- setup tests runners
        rust = "nvim-test.runners.cargo-test",
        javascriptreact = "nvim-test.runners.jest",
        javascript = "nvim-test.runners.jest",
        typescript = "nvim-test.runners.jest",
        typescriptreact = "nvim-test.runners.jest",
    },
}

vim.cmd [[highlight Visual guibg=#FFFF80 guifg=#000000]]
