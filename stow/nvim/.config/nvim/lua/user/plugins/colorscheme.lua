return {
	"catppuccin/nvim",
	priority = 1000,
  lazy = false,
	name = "catppuccin",
	config = function()
    require("catppuccin").setup({
      integrations = {
        treesitter  = true,
        -- nvimtree = true,
        -- lualine = true,
      }
    })
		vim.cmd([[colorscheme catppuccin-mocha]]);
	end,
}
