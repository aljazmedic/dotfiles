return {
    "akinsho/bufferline.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "catppuccin",
    },
    version = "*",
    opts = { -- require(name).setup(opts)
        options = {
 --            highlights = require("catppuccin.groups.integrations.bufferline").get(),
            mode = "tabs",
            separator_style = "slant",
        },
    },
}
