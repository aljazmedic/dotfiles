return {
  -- Wrap CLI formatters with lsp
  "nvimtools/none-ls.nvim",
  event = "VeryLazy",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        -- JavaScript
        null_ls.builtins.formatting.prettierd,
        -- Python
        null_ls.builtins.formatting.black,
        -- OCaml
        null_ls.builtins.formatting.ocamlformat,
      },
    })
    local keymap = vim.keymap
    keymap.set("n", "<leader>F", function()
      vim.lsp.buf.format({ async = true })
    end, { desc = "Format buffer" })
  end,
}
