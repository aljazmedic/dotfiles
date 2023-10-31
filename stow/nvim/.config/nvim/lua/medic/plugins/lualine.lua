return {
  "nvim-lualine/lualine.nvim",
  dependancies = { 
    "nvim-tree/nvim-web-devicons",
  },
  config = function ()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")

    lualine.setup({
      theme = "catppuccin",
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
    })
  end,
}
