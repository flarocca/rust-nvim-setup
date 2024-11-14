require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

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
map("n", "<Leader>de", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger reset",  })
map("n", "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debugger run last" })

-- Rustaceanvim
map("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables" })

-- LSP
map("n", "<Leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition", noremap=true, silent=true })
map("n", "<Leader>gh", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Hover actions", noremap=true, silent=true })
map("n", "<Leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "Go to implementation", noremap=true, silent=true })
map("n", "<Leader>gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "Signature", noremap=true, silent=true })
map("n", "<Leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { desc = "Go to type definition", noremap=true, silent=true })
map("n", "<Leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "Find references", noremap=true, silent=true })
-- -- map("n", "g0", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", options)
-- -- map("n", "gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", options)
map("n", "<Leader>ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code actions", noremap=true, silent=true })