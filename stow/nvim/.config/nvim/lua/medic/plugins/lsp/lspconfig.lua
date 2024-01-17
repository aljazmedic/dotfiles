return {
	{
		-- bridge between lspconfig and mason
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"tsserver",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- lsp client
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

      local servers = {
        "tsserver", "html", "tailwindcss", "lua_ls", "eslint",
      }

      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({
          capabilities = capabilities,
        })
      end

			local keymap = vim.keymap
			keymap.set("n", "K", vim.lsp.buf.hover, {})
			keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			keymap.set("n", "gd", vim.lsp.buf.definition, {})
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			keymap.set("n", "<leader>h", vim.lsp.buf.rename, {})
		end,
	},
}
