require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = { "html", "cssls", "typescript", "typescriptreact" }
local nvlsp = require "nvchad.configs.lspconfig"

-- Función para configurar keymaps para cada servidor
-- local on_attach = function(_, bufnr)
--     local opts = { noremap = true, silent = true, buffer = bufnr }
--
--     -- Keybindings LSP
--     vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
--     vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
--     vim.keymap.set("n", "<leader>ga", vim.lsp.buf.code_action, opts)
--     vim.keymap.set("n", "<leader>gm", function()
--         vim.lsp.buf.format { async = true }
--     end, opts)
-- end

-- Configuración para JSON
-- lspconfig.jsonls.setup {
--     settings = {
--         json = {
--             schemas = require("schemastore").json.schemas(),
--             validate = { enable = true },
--         },
--     },
--     capabilities = nvlsp.capabilities,
--     -- on_attach = on_attach,
-- }
--
-- -- Configuración para Lua
-- lspconfig.lua_ls.setup {
--     settings = {
--         Lua = {
--             runtime = {
--                 version = "LuaJIT",
--             },
--             diagnostics = {
--                 globals = { "vim" },
--             },
--             workspace = {
--                 library = vim.api.nvim_get_runtime_file("", true),
--                 checkThirdParty = false,
--             },
--             telemetry = {
--                 enable = false,
--             },
--         },
--     },
--     capabilities = nvlsp.capabilities,
--     -- on_attach = on_attach,
-- }

-- LSP para TOML
lspconfig.taplo.setup {
    capabilities = capabilities,
}

-- lsps with default config
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = nvlsp.on_attach,
        on_init = nvlsp.on_init,
        capabilities = capabilities,
    }
end

local configs = require "lspconfig.configs"

configs.solidity = {
    default_config = {
        cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
        filetypes = { "solidity" },
        root_dir = lspconfig.util.find_git_ancestor,
        single_file_support = true,
    },
}

lspconfig.solidity.setup {}
