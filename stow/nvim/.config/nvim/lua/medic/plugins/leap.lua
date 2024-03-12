return {
	"ggandor/leap.nvim",
	dependencies = {
		{ "tpope/vim-repeat" },
    { "folke/which-key.nvim" },
	},
	event = "VeryLazy",
	config = function()
		local leap = require("leap")
    leap.add_default_mappings()
    -- vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap-forward)', { noremap = false })
	end,
}
