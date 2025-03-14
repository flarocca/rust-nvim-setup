return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        vim.opt.termguicolors = true

        local bl = require "bufferline"

        bl.setup {
            options = {
                diagnostics_indicator = function(count, level)
                    local icon = level:match "error" and " " or ""
                    return " " .. icon .. count
                end,
                show_buffer_close_icons = false,
                show_close_icon = false,
                show_tab_indicators = true,
                always_show_bufferline = true,
                separator_style = "thick",
                numbers = "ordinal",
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "File Explorer",
                        separator = true,
                    },
                },
            },
        }
    end,
}