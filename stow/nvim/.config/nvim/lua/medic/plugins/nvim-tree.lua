return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons"
	},
	config = function()
		local nvimtree = require("nvim-tree")

		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvimtree.setup({
			view = {
				width = 40,
			},
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
			git = {
				ignore = false,
			}
		})

		local keymap = vim.keymap;

		keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>") -- Toggle file explorer
		-- keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>") -- Toggle file explorer
		-- keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>") -- Toggle file explorer
		-- keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>") -- Toggle file explorer
	end,
}
