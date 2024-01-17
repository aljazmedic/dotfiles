return {
  -- change some telescope options and a keymap to browse plugin files
  -- {
  --   opts = {
  --     defaults = {
  --       layout_strategy = "horizontal",
  --       layout_config = { prompt_position = "top" },
  --       sorting_strategy = "ascending",
  --       winblend = 0,
  --     },
  --   },
  -- },
  "nvim-telescope/telescope.nvim",
  dependencies = {{
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
  { "nvim-lua/plenary.nvim" },
  { 'nvim-telescope/telescope-ui-select.nvim' },
},

config = function ()
  local telescope = require("telescope")
  local actions = require("telescope.actions")
  telescope.setup({
    defaults = {
      mappings = {
        i = {
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        },
      },
    },
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown {},
      },
    },
  })
  telescope.load_extension("ui-select")
  -- telescope.load_extension("fzf")
  local keymap = vim.keymap
  -- README
  keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
  keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
  keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
  keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
  keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
end,
}
