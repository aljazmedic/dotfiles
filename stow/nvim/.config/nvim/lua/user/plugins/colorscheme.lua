return {
  'catppuccin/nvim',
  priority = 1000,
  lazy = false,
  name = 'catppuccin',
  config = function()
    require('catppuccin').setup {
      background = { -- :h background
        light = 'latte',
        dark = 'mocha',
      },
      default_integrations = true,
      integrations = {
        treesitter = true,
        nvimtree = true,
        gitsigns = true,
      },
      transparent_background = true,
      dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = 'dark',
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
    }
    vim.cmd [[colorscheme catppuccin-mocha]]
  end,
}
