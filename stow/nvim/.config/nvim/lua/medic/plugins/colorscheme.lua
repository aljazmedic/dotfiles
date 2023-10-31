return {
	"catppuccin/nvim",
	priority = 1000,
	name = "catppuccin",
	config = function()
    require("catppuccin").setup({
      integrations = {
        treesitter  = true,
        nvimtree = true,
        bufferline = true,
      }
    })
		vim.cmd([[colorscheme catppuccin-mocha]]);
	end,
}
