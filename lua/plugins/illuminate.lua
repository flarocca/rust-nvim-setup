return {
  {
    "RRethy/vim-illuminate",
    lazy = false,
    config = function()
      require("illuminate").configure {
        providers = {
          "lsp",
          "regex",
        },
        delay = 200,
        filetypes_denylist = {
          "dirvish",
          "fugitive",
          "NvimTree",
          "packer",
          "qf",
          "help",
        },
      }
    end,
  },
}
