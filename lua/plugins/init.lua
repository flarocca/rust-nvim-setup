return {
    {
        "nvim-tree/nvim-web-devicons",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
        "debugloop/telescope-undo.nvim",
        "nvim-telescope/telescope-live-grep-args.nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/vim-vsnip",
        "hrsh7th/vim-vsnip-integ",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-vsnip",
    },
    {
        "stevearc/conform.nvim",
        event = "BufWritePre", -- uncomment for format on save
        opts = require "configs.conform",
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },
    {
        "mrcjkb/rustaceanvim",
        version = "^5",
        lazy = false,
        ft = "rust",
        config = function()
            local mason_registry = require "mason-registry"
            local codelldb = mason_registry.get_package "codelldb"
            local extension_path = codelldb:get_install_path() .. "/extension/"
            local codelldb_path = extension_path .. "adapter/codelldb"
            local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
            local cfg = require "rustaceanvim.config"

            vim.g.rustaceanvim = {
                dap = {
                    adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
                },
            }
            vim.g.rustfmt_autosave = 1
        end,
    },
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap, dapui = require "dap", require "dapui"
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            require("dapui").setup()
        end,
    },
    {
        "saecki/crates.nvim",
        ft = { "toml" },
        config = function()
            require("crates").setup {
                completion = {
                    cmp = {
                        enabled = true,
                    },
                },
            }
            require("cmp").setup.buffer {
                sources = { { name = "crates" } },
            }
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
    },
    {
        "aaronhallaert/advanced-git-search.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "tpope/vim-fugitive",
            "tpope/vim-rhubarb",
        },
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            routes = {
                {
                    filter = { event = "notify", find = "No information available" },
                    opts = { skip = true },
                },
            },
            presets = {
                lsp_doc_border = true,
            },
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        lazy = false,
        branch = "canary",
        dependencies = {
            { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
            { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
        },
        build = "make tiktoken", -- Only on MacOS or Linux
        config = function()
            require("CopilotChat").setup {}
        end,
        -- See Commands section for default commands if you want to lazy load on them
    },
}
