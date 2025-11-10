return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        lazy = false,
        branch = "main",
        dependencies = {
            { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
            { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
        },
        build = "make tiktoken", -- Only on MacOS or Linux
        opts = {
            model = "gpt-5", -- AI model to use
            -- temperature = 0.1, -- Lower = focused, higher = creative
            window = {
                width = 0.35, -- 50% of screen width
            },
            auto_insert_mode = true, -- Enter insert mode when opening
        },
    },
}
