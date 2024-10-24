return {
	-- LSP provider
	"williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "gopls",
    },
  },
}
