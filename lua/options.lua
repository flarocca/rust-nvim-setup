require "nvchad.options"

vim.cmd "let g:netrw_liststyle = 3"

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 4 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true
opt.cursorcolumn = true
-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append "unnamedplus" -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

-- LSP: Show diagnostic popup on cursor hold
-- vim.api.nvim_create_autocmd({ 'CursorHold' }, {
--   pattern = { "*" },
--   command = ':lua vim.diagnostic.open_float({ scope="line", focus = false })',
-- })

vim.lsp.inlay_hint.enable(true)

vim.o.fillchars = [[eob: ,fold: ,foldopen:▾,foldsep: ,foldclose:▸]]
vim.o.foldcolumn = "auto:9" -- '0' is not bad
vim.o.foldnestmax = 1
vim.o.foldlevel = 99999999 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99999999
vim.o.foldenable = true

vim.o.scrolloff = 5 -- Keep some context lines above/below the cursor
vim.o.sidescrolloff = 5 -- Keep some context lines to the left/right

-- Redrawing and cursor enhancements
vim.o.lazyredraw = false -- Ensure no delay in screen redrawing
vim.o.cursorline = true -- Highlight the current line
vim.o.cursorcolumn = true -- Highlight the current column
vim.o.cursorlineopt = "number,line"
