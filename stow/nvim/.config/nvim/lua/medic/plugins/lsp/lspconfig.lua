return {
	{
		-- bridge between lspconfig and mason
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"tsserver",
          "ocamllsp",
          "pylsp",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- lsp client
      'folke/which-key.nvim',
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

      local servers = {
        "tsserver", "html", "tailwindcss", "lua_ls", "eslint", "ocamllsp", "pylsp",
      }

      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({
          capabilities = capabilities,
        })
      end

      local wk = require("which-key")
      wk.register({
        g = {
          D = { vim.lsp.buf.declaration, "Goto Declaration" },
          d = { vim.lsp.buf.definition, "Goto Definition" },
        },
        ["<leader>"] = {
          c = { vim.lsp.buf.code_action, "Code Action" },
          r = { vim.lsp.buf.rename, "Rename" },
        },
        K = { vim.lsp.buf.hover, "Hover" },
      })
		end,
	},
}
