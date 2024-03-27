return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- lsp client
			{ "williamboman/mason-lspconfig.nvim", config = true },
			"williamboman/mason.nvim",
			"folke/which-key.nvim",
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			local servers = {
				"tsserver",
				"html",
				"tailwindcss",
				"eslint",
				"ocamllsp",
				"pylsp",
			}

			for _, lsp in ipairs(servers) do
				lspconfig[lsp].setup({
					capabilities = capabilities,
				})
			end
			lspconfig["lua_ls"].setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			})

			local wk = require("which-key")
			local telescope = require("telescope.builtin")
			wk.register({
				g = {
					name = "Goto",
					D = { vim.lsp.buf.declaration, "Declaration" },
					d = { vim.lsp.buf.definition, "Definition" },
					i = { vim.lsp.buf.implementation, "Implementation" },
				},
				K = { vim.lsp.buf.hover, "Documentation" },
				["<leader>"] = {
					r = { vim.lsp.buf.rename, "Rename" },
					l = {
						name = "LSP",
						s = { telescope.lsp_document_symbols, "Document Symbols" },
						S = { telescope.lsp_dynamic_workspace_symbols, "Workspace Symbols" },
						e = { telescope.quickfix, "Telescope Quickfix" },
					},
				},
			})
			wk.register({
				c = { vim.lsp.buf.code_action, "Code Action" },
			}, { mode = { "n", "v" }, prefix = "<leader>" })
		end,
	},
}
