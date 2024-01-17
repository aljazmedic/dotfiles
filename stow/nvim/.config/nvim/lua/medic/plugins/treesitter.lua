return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      autoinstall = true,
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    },
    build = ":TSUpdate",
  },
  'nvim-treesitter/playground',
}
