return {
  {
    'nvim-tree/nvim-web-devicons'
  },
  {
    "nvim-lua/plenary.nvim",
  },
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "simrat39/rust-tools.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    dependencies = {"neovim/nvim-lspconfig", "nvim-lua/plenary.nvim"},
    config = function()
      local rt = require("rust-tools")

      rt.setup({
        server = {
          on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>.", rt.code_action_group.code_action_group, { buffer = bufnr })
          end,
        },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
    ft = "rust",
    config = function ()
      local mason_registry = require('mason-registry')
      local codelldb = mason_registry.get_package("codelldb")
      local extension_path = codelldb:get_install_path() .. "/extension/"
      local codelldb_path = extension_path .. "adapter/codelldb"
      local liblldb_path = extension_path.. "lldb/lib/liblldb.dylib"
      local cfg = require('rustaceanvim.config')

      vim.g.rustaceanvim = {
        dap = {
          adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
        },
      }
    end
  },

  {
    'rust-lang/rust.vim',
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },

  {
    'mfussenegger/nvim-dap',
    config = function()
			local dap, dapui = require("dap"), require("dapui")
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
    'rcarriga/nvim-dap-ui', 
    dependencies = {
      "mfussenegger/nvim-dap", 
      "nvim-neotest/nvim-nio"
    },
    config = function()
			require("dapui").setup()
		end,
  },

  {
    'saecki/crates.nvim',
    ft = {"toml"},
    config = function()
      require("crates").setup {
        completion = {
          cmp = {
            enabled = true
          },
        },
      }
      require('cmp').setup.buffer({
        sources = { { name = "crates" }}
      })
    end
  },

  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", 
      "MunifTanjim/nui.nvim",
    }
  },
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   dependencies = {
  --     "nvim-tree/nvim-web-devicons", 
  --   },
  --   opts = require "configs.lualine",
  -- },
  { 
    'hrsh7th/nvim-cmp',
  },
  { 
    'hrsh7th/cmp-nvim-lsp',
  },
  { 
    'hrsh7th/cmp-vsnip',
  },
  { 
    'hrsh7th/vim-vsnip',
  },
  { 
    'hrsh7th/vim-vsnip-integ',
  },
  { 
    'hrsh7th/cmp-path',
  },
  { 
    'hrsh7th/cmp-buffer',
  },
}
