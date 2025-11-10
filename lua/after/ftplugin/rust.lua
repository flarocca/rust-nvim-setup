local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set("n", "<leader>a", function()
    vim.cmd.RustLsp "codeAction" -- supports rust-analyzer's grouping
    -- or vim.lsp.buf.codeAction() if you don't want grouping.
end, { silent = true, buffer = bufnr, desc = "Code actions" })
vim.keymap.set(
    "n",
    "<leader>h", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
    function()
        vim.cmd.RustLsp { "hover", "actions" }
    end,
    { silent = true, buffer = bufnr, desc = "Hover actions" }
)
vim.keymap.set(
    "n",
    "<leader>rg", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
    function()
        vim.cmd.RustLsp "relatedDiagnostics"
    end,
    { silent = true, buffer = bufnr, desc = "Related diagnostic" }
)
vim.keymap.set(
    "n",
    "<leader>f[",
    function()
        vim.cmd.RustLsp "relatedDiagnostics"
    end,
    -- "<cmd>lua vim.diagnostic.goto_prev()<CR>",
    { desc = "Find next diagnostic", noremap = true, silent = true }
)
vim.keymap.set(
    "n",
    "<leader>f]",
    function()
        vim.cmd.RustLsp { "renderDiagnostic", "cycle_prev" }
    end,
    -- "<cmd>lua vim.diagnostic.goto_next()<CR>",
    { desc = "Find prev diagnostic", noremap = true, silent = true }
)
