return {
	"folke/which-key.nvim",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		local wk = require("which-key")
		-- Normal Mode
		wk.register({
      ["<leader>l"] ={ "<cmd>Lazy<CR>", "Lazy window" },
			["<leader>S"] = { "<cmd>w! !sudo tee % > /dev/null<CR><CR>", "Sudo save" },
			t = {
				name = "Tabs",
				o = { "<cmd>tabnew<CR>", "New tab" },
				c = { "<cmd>tabclose<CR>", "Close tab" },
				n = { "<cmd>tabn<CR>", "Next tab" },
				p = { "<cmd>tabp<CR>", "Prev tab" },
			},
			J = { "mzJ`z", "Weird Primagen stuff" },
			-- Recenter remaps
			["<C-d>"] = { "<C-d>zz", "Down/Up" },
			["<C-u>"] = { "<C-u>zz", "Down/Up" },
			n = { "nzzzv", "Next re-center" },
			N = { "Nzzzv", "Prev re-center" },

			Q = { "<nop>", "Nop?" },

			X = { "<cmd>!chmod +x %<CR>", "Make executable" },
		}, { mode = "n" })

		-- Visual Mode
		wk.register({
			J = { "m '>+1<CR>gv=gv", "Move lines down" },
			K = { "m '<-2<CR>gv=gv", "Move lines up" },
		}, { mode = "v" })

		wk.register({
			s = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Substitute" },
		}, { prefix = "<leader>", mode = { "n", "v" } })

		-- Normal and Insert Mode
		wk.register({
			-- Normal save
			["<C-s>"] = { "<cmd>w<CR><Esc>", "Save" },
			-- Sudo save
			["<C-S>"] = { "<cmd>w !sudo tee % > /dev/null<CR><CR>", "Sudo save" },

			["<C-f>"] = { "<cmd>silent !tmux neww tmux-sessionizer<CR>", "New tmux window" },
			["<C-k>"] = { "<cmd>cnext<CR>zz", "Next quickfix" },
			["<C-j>"] = { "<cmd>cprev<CR>zz", "Prev quickfix" },
			["<C-c>"] = { "<Esc>", "Exit insert mode" },
		}, { mode = { "n", "i" } })
	end,
}
