require "nvchad.mappings"

local map = vim.keymap.set

-- Nvim Tree
map("n", "<Leader>ef", "<cmd>NvimTreeFocus<CR>", { desc = "NvimTree Focus", noremap = true, silent = true })
map("n", "<Leader>et", "<cmd>NvimTreeToggle<CR>", { desc = "NvimTree Toggle", noremap = true, silent = true })

-- Nvim DAP
map("n", "<Leader>dl", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
map("n", "<Leader>dj", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
map("n", "<Leader>dk", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
map("n", "<Leader>dc", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue" })
map("n", "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Debugger toggle breakpoint" })
map(
    "n",
    "<Leader>dd",
    "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
    { desc = "Debugger set conditional breakpoint" }
)
map("n", "<Leader>de", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger reset" })
map("n", "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debugger run last" })

-- Rustaceanvim
map("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables" })

-- LSP
map(
    "n",
    "<Leader>gd",
    "<cmd>lua vim.lsp.buf.definition()<CR>",
    { desc = "Go to definition", noremap = true, silent = true }
)
map("n", "<Leader>gh", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Hover actions", noremap = true, silent = true })
map(
    "n",
    "<Leader>gi",
    "<cmd>lua vim.lsp.buf.implementation()<CR>",
    { desc = "Go to implementation", noremap = true, silent = true }
)
map(
    "n",
    "<Leader>gs",
    "<cmd>lua vim.lsp.buf.signature_help()<CR>",
    { desc = "Signature", noremap = true, silent = true }
)
map(
    "n",
    "<Leader>gt",
    "<cmd>lua vim.lsp.buf.type_definition()<CR>",
    { desc = "Go to type definition", noremap = true, silent = true }
)
map("n", "<Leader>gr", "<cmd>Telescope lsp_references<CR>", { desc = "Find references", noremap = true, silent = true })
map(
    "n",
    "<Leader>ga",
    "<cmd>lua vim.lsp.buf.code_action()<CR>",
    { desc = "Code actions", noremap = true, silent = true }
)
map("n", "<Leader>gn", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Remane", noremap = true, silent = true })

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
map("n", "zR", require("ufo").openAllFolds, { desc = "Unfold all" })
map("n", "zM", require("ufo").closeAllFolds, { desc = "Fold all" })
map("n", "zr", require("ufo").openFoldsExceptKinds, { desc = "Fold current" })
map("n", "K", function()
    local winid = require("ufo").peekFoldedLinesUnderCursor()
    if not winid then
        -- vim.lsp.buf.hover()
        vim.cmd [[ Lspsaga hover_doc ]]
    end
end, { desc = "Peek fold" })

-- Telescope
local builtin = require "telescope.builtin"
map("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
map(
    "n",
    "<leader>fg",
    "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
    { desc = "Live Grep" }
)
map(
    "n",
    "<leader>fc",
    '<cmd>lua require("telescope.builtin").live_grep({ glob_pattern = "!{spec,test}"})<CR>',
    { desc = "Live Grep Code" }
)
map("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Find Help Tags" })
map("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Find Symbols" })
map("n", "<leader>fo", builtin.oldfiles, { desc = "Find Old Files" })
map("n", "<leader>fw", builtin.grep_string, { desc = "Find Word under Cursor" })
map("n", "<leader>fk", builtin.keymaps, { desc = "Find Keymaps" })
map("n", "<leader>fd", builtin.diagnostics, { desc = "Find Diagnostics" })

-- Test Runner
map("n", "<leader>tf", "<cmd>TestFile<CR>", { desc = "Test File" })
map("n", "<leader>ts", "<cmd>TestFile<CR>", { desc = "Test Suite" })
map("n", "<leader>tn", "<cmd>TestFile<CR>", { desc = "Test Nearer to cursor" })
map("n", "<leader>tl", "<cmd>TestFile<CR>", { desc = "Test Last" })
map("n", "<leader>tv", "<cmd>TestFile<CR>", { desc = "Test Visit" })
