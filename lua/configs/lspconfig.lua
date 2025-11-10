-- Load NvChad defaults (on_attach, on_init, capabilities, etc.)
require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.configs.lspconfig"

-- Prefer NvChad's capabilities if provided, fall back to cmp_nvim_lsp
local capabilities = nvlsp.capabilities
    or require("cmp_nvim_lsp").default_capabilities()

-- List of servers using the same base config
local servers = { "html", "cssls", "ts_ls", "pyright", "ruff_lsp" }

-- Helper: configure + enable a server with base NvChad defaults
local function setup_server(name, extra)
  local base = {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = capabilities,
  }

  local config = extra and vim.tbl_deep_extend("force", base, extra) or base

  -- Guard for Neovim versions without vim.lsp.config
  if not vim.lsp.config or not vim.lsp.enable then
    vim.notify(
      ("vim.lsp.config/vim.lsp.enable not available, cannot setup server %s"):format(name),
      vim.log.levels.WARN
    )
    return
  end

  -- Register config (merged with any built-in defaults)
  vim.lsp.config(name, config)
  -- Enable server so it starts for its filetypes
  vim.lsp.enable(name)
end

-- TypeScript / ESLint configuration
setup_server("eslint", {
  settings = {
    packageManager = "yarn",
  },
  ---@diagnostic disable-next-line: unused-local
  on_attach = function(client, bufnr)
    -- allow NvChad's on_attach to still run
    if nvlsp.on_attach then
      nvlsp.on_attach(client, bufnr)
    end

    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})

-- TAPLO (TOML) LSP
setup_server("taplo")

-- Servers with plain default config
for _, name in ipairs(servers) do
  setup_server(name)
end

-- Solidity LSP custom config
-- Replacement for lspconfig.util.find_git_ancestor
local function solidity_root(fname)
  -- start search from the directory of the current file
  local start_dir = vim.fs.dirname(fname)
  local root_file = vim.fs.find({ ".git" }, {
    upward = true,
    path = start_dir,
    type = "directory",
  })[1]

  if not root_file then
    return nil
  end

  return vim.fs.dirname(root_file)
end

setup_server("solidity", {
  cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
  filetypes = { "solidity" },
  root_dir = solidity_root,
  single_file_support = true,
})
