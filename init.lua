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
                "node_modules",
                "target",
                "build",
                ".git",
            },
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
