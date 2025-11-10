require "nvchad.options"

vim.cmd "let g:netrw_liststyle = 3"

local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.tabstop = 4       -- 4 spaces for a tab
opt.shiftwidth = 4    -- 4 spaces for indent width
opt.expandtab = true  -- convert tabs to spaces
opt.autoindent = true -- copy indent from current line

-- wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case by default
opt.smartcase = true  -- if pattern has uppercase, make search case-sensitive

-- cursor highlight
opt.cursorline = true
opt.cursorcolumn = true
opt.cursorlineopt = "number,line"

-- colors / UI
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace behavior
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append "unnamedplus"

-- splits
opt.splitright = true
opt.splitbelow = true

-- swap
opt.swapfile = false

-- folds (for ufo or similar)
opt.fillchars = {
  eob = " ",
  fold = " ",
  foldopen = "▾",
  foldsep = " ",
  foldclose = "▸",
}
opt.foldcolumn = "auto:9"
opt.foldnestmax = 1
opt.foldlevel = 99999999
opt.foldlevelstart = 99999999
opt.foldenable = true

-- scrolling context
opt.scrolloff = 5
opt.sidescrolloff = 5

-- Redrawing
opt.lazyredraw = false

-- LSP inlay hints: enable per buffer on attach, if available
if vim.lsp.inlay_hint and vim.lsp.inlay_hint.enable then
  local group = vim.api.nvim_create_augroup("LspInlayHints", { clear = true })

  vim.api.nvim_create_autocmd("LspAttach", {
    group = group,
    callback = function(event)
      local client = vim.lsp.get_client_by_id(event.data.client_id)
      if not client then
        return
      end

      -- Only enable if the server supports inlay hints (rust-analyzer does)
      if client.server_capabilities.inlayHintProvider then
        -- New API: boolean first, then opts table
        pcall(vim.lsp.inlay_hint.enable, true, { bufnr = event.buf })
      end
    end,
  })
end

-- Example: diagnostic popup on CursorHold (keep commented if you don't want it)
vim.opt.updatetime = 1000
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { scope = "line", focus = false })
  end,
})
