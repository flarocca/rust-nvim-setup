return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  event = "VeryLazy",
  opts = {
    open_fold_hl_timeout = 400,
    -- close_fold_kinds = { "imports", "comment" },
    preview = {
      win_config = {
        border = { "", "─", "", "", "", "─", "", "" },
        -- winhighlight = "Normal:Folded",
        winblend = 0,
      },
      mappings = {
        scrollU = "<C-u>",
        scrollD = "<C-d>",
        jumpTop = "[",
        jumpBot = "]",
      },
    },
  },
  config = function(_, opts)
    local function fold_virt_text_handler(virtText, lnum, endLnum, width, truncate)
      local newVirtText = {}
      local totalLines = vim.api.nvim_buf_line_count(0)
      local foldedLines = endLnum - lnum

      -- avoid division by zero
      local percent = 0
      if totalLines > 0 then
        percent = math.floor(foldedLines / totalLines * 100)
      end

      local suffix = ("  %d %d%%%%"):format(foldedLines, percent)
      local sufWidth = vim.fn.strdisplaywidth(suffix)
      local targetWidth = width - sufWidth
      local curWidth = 0

      for _, chunk in ipairs(virtText) do
        local chunkText, hlGroup = chunk[1], chunk[2]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)

        if targetWidth > curWidth + chunkWidth then
          table.insert(newVirtText, chunk)
        else
          chunkText = truncate(chunkText, targetWidth - curWidth)
          chunkWidth = vim.fn.strdisplaywidth(chunkText)
          table.insert(newVirtText, { chunkText, hlGroup })

          -- padding if truncate produced less than requested
          if curWidth + chunkWidth < targetWidth then
            suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
          end
          break
        end

        curWidth = curWidth + chunkWidth
      end

      -- right-align suffix using buffer textwidth or fallback to full width
      local tw = vim.bo.textwidth
      if tw == 0 then
        tw = width
      end
      local rAlign = math.max(math.min(tw, width - 1) - curWidth - sufWidth, 0)
      suffix = (" "):rep(rAlign) .. suffix

      table.insert(newVirtText, { suffix, "MoreMsg" })
      return newVirtText
    end

    opts.fold_virt_text_handler = fold_virt_text_handler
    require("ufo").setup(opts)

    vim.fn.sign_define("FoldClosed", { text = "▸", texthl = "Folded" })
    vim.fn.sign_define("FoldOpen", { text = "▾", texthl = "Folded" })
    vim.fn.sign_define("FoldSeparator", { text = " ", texthl = "Folded" })
  end,
}
