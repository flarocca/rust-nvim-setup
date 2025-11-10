vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- handle vim.uv vs vim.loop for older neovim
local uv = vim.uv or vim.loop

if not uv.fs_stat(lazypath) then
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
  run = true,
  commands_create = true,
  filename_modifier = ":.",
  silent = false,
  term = "terminal",
  termOpts = {
    direction = "vertical",
    width = 96,
    height = 24,
    go_back = false,
    stopinsert = "auto",
    keep_one = true,
  },
  runners = {
    rust = "nvim-test.runners.cargo-test",
    javascriptreact = "nvim-test.runners.jest",
    javascript = "nvim-test.runners.jest",
    typescript = "nvim-test.runners.jest",
    typescriptreact = "nvim-test.runners.jest",
  },
}

vim.cmd [[highlight Visual guibg=#FFFF80 guifg=#000000]]

local neoscroll = require "neoscroll"
local keymap = {
  ["<C-u>"] = function()
    neoscroll.ctrl_u { duration = 150 }
  end,
  ["<C-d>"] = function()
    neoscroll.ctrl_d { duration = 150 }
  end,
  ["<C-b>"] = function()
    neoscroll.ctrl_b { duration = 150 }
  end,
  ["<C-f>"] = function()
    neoscroll.ctrl_f { duration = 150 }
  end,
  ["<PageUp>"] = function()
    neoscroll.ctrl_b { duration = 150 }
  end,
  ["<PageDown>"] = function()
    neoscroll.ctrl_f { duration = 150 }
  end,
  ["<C-y>"] = function()
    neoscroll.scroll(-0.1, { move_cursor = false, duration = 50 })
  end,
  ["<C-e>"] = function()
    neoscroll.scroll(0.1, { move_cursor = false, duration = 50 })
  end,
  ["zt"] = function()
    neoscroll.zt { half_win_duration = 150 }
  end,
  ["zz"] = function()
    neoscroll.zz { half_win_duration = 150 }
  end,
  ["zb"] = function()
    neoscroll.zb { half_win_duration = 150 }
  end,
}

local modes = { "n", "v", "x" }
for key, func in pairs(keymap) do
  vim.keymap.set(modes, key, func)
end

neoscroll.setup {
  duration = 0.15,
}
