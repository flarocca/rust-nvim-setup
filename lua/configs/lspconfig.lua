require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = { "html", "cssls", "ts_ls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- TypeScript configuration
lspconfig.eslint.setup {
    settings = {
        packageManager = "yarn",
    },
    ---@diagnostic disable-next-line: unused-local
    on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
        })
    end,
}

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
