return {
  "mrcjkb/rustaceanvim",
  version = "^6",
  ft = { "rust", "toml" },
  lazy = true,
  config = function()
    vim.g.rustaceanvim = {
      tools = {
        code_actions = {
          ui_select_fallback = true,
        },
        hover_actions = {
          ui_select_fallback = true,
        },
      },
    }
  end,
}
