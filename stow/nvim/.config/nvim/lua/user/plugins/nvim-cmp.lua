return {
	"hrsh7th/nvim-cmp", -- Autocompletion
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source from current buffer
		"hrsh7th/cmp-path", -- filepath
		"hrsh7th/cmp-nvim-lsp", -- lsp client
		"onsails/lspkind.nvim",
		"L3MON4D3/LuaSnip", -- Engine for snippets
		"saadparwaiz1/cmp_luasnip", -- nvim-cmp snippets
		"rafamadriz/friendly-snippets", -- Collection of snippets
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")
		require("luasnip.loaders.from_vscode").lazy_load()

		vim.opt.completeopt = "menu,menuone,noselect"
		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_extend(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				-- Add scrolling docs
				["<C-Space>"] = cmp.mapping.complete(),
        -- Must not be C-c, because then we need two clicks to exit insert mode,
        -- when completions are available
				["<ESC>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				-- { name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),
			-- configure lspkind for vs-code like icons?
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
		})
	end,
}
