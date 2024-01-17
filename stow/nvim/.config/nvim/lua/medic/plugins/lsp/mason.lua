return {
  -- LSP provider
  "williamboman/mason.nvim",
  config = function ()
    require("mason").setup({
      ensure_installed = {
        "prettierd",
        "lua_ls",
        "tsserver",
        "tailwindcss",
        "eslint-lsp",
      },
    })
  end,
}
