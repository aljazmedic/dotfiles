return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    {
      "s1n7ax/nvim-window-picker",
      name = "window-picker",
      event = "VeryLazy",
      version = "2.*",
      config = function()
        require("window-picker").setup()
      end,
    },
  },
  config = function()
    --
    --		-- recommended settings from nvim-tree documentation
    --		vim.g.loaded_netrw = 1
    --		vim.g.loaded_netrwPlugin = 1
    --
    --		nvimtree.setup({
    --			view = {
    --				width = 40,
    --			},
    --      actions = {
    --        open_file = {
    --          window_picker = {
    --            enable = false,
    --          },
    --        },
    --      },
    --			git = {
    --				ignore = false,
    --			}
    --		})
    --
    require("neo-tree").setup({})
    local keymap = vim.keymap
    keymap.set("n", "<leader>e", "<cmd>Neotree filesystem toggle left<CR>") -- Toggle file explorer
    --		-- keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>") -- Toggle file explorer
    --		-- keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>") -- Toggle file explorer
    --		-- keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>") -- Toggle file explorer
  end,
}
