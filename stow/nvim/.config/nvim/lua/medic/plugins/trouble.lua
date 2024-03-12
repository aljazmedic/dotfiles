return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/which-key.nvim" },
	config = function()
		local trouble = require("trouble")
		trouble.setup({
			icons = true,
			auto_preview = false,
			auto_fold = true,
			use_diagnostic_signs = true,
		})
		local wk = require("which-key")
    vim.o.timeout = true
		wk.register({
			["<leader>"] = {
				x = {
					name = "Trouble",
					x = { trouble.toggle, "Toggle" },
					w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics" },
					d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics" },
					q = { "<cmd>Trouble quickfix<cr>", "Quickfix" },
					l = { "<cmd>TroubleToggle loclist<cr>", "Location List" },
				},
			},
			["g"] = {
				R = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
			},
		})
	end,
}
