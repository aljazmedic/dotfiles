local M = {
	"folke/which-key.nvim",
	event = "VeryLazy",
}

function M.config()
	local mappings = {
		L = { "<cmd>Lazy<CR>", "Lazy" },
		S = { "<cmd>w! !sudo tee % > /dev/null<CR><CR>", "Sudo save" },
		q = { "<cmd>confirm q<CR>", "Quit" },
		h = { "<cmd>nohlsearch<CR>", "NOHL" },
		[";"] = { "<cmd>tabnew | terminal<CR>", "Term" },
		v = { "<cmd>vsplit<CR>", "Split" },
		J = { "mzJ`z", "Weird Primagen stuff" },
		d = {
			name = "Debug",
		},
		p = {
			name = "Plugins",
		},
		t = {
			name = "Test",
		},
		a = {
			name = "Tab",
			n = { "<cmd>$tabnew<cr>", "New Empty Tab" },
			N = { "<cmd>tabnew %<cr>", "New Tab" },
			o = { "<cmd>tabonly<cr>", "Only" },
			c = { "<cmd>tabclose<CR>", "Close tab" },
			h = { "<cmd>-tabmove<cr>", "Move Left" },
			l = { "<cmd>+tabmove<cr>", "Move Right" },

			["1"] = { "<cmd>1tabnext<cr>", "Tab 1" },
			["2"] = { "<cmd>2tabnext<cr>", "Tab 2" },
			["3"] = { "<cmd>3tabnext<cr>", "Tab 3" },
			["4"] = { "<cmd>4tabnext<cr>", "Tab 4" },
			["5"] = { "<cmd>5tabnext<cr>", "Tab 5" },
			["6"] = { "<cmd>6tabnext<cr>", "Tab 6" },
			["7"] = { "<cmd>7tabnext<cr>", "Tab 7" },
			["8"] = { "<cmd>8tabnext<cr>", "Tab 8" },
			["9"] = { "<cmd>9tabnext<cr>", "Tab 9" },
		},
		T = {
			name = "Treesitter",
		},
		X = { "<cmd>!chmod +x %<CR>", "Make executable" },
	}

	local which_key = require("which-key")
	which_key.setup({
		plugins = {
			marks = true,
			registers = true,
			spelling = {
				enabled = true,
				suggestions = 20,
			},
			presets = {
				operators = false,
				motions = false,
				text_objects = false,
				windows = false,
				nav = false,
				z = false,
				g = false,
			},
		},
		window = {
			border = "rounded",
			position = "bottom",
			padding = { 2, 2, 2, 2 },
		},
		ignore_missing = true,
		show_help = false,
		show_keys = false,
		disable = {
			buftypes = {},
			filetypes = { "TelescopePrompt" },
		},
	})

	which_key.register(mappings, {
		mode = "n", -- NORMAL mode
		prefix = "<leader>",
	})
	which_key.register({
		-- Normal save
		["<C-s>"] = { "<cmd>w<CR><Esc>", "Save" },
		-- Sudo save
		["<C-S>"] = { "<cmd>w !sudo tee % > /dev/null<CR><CR>", "Sudo save" },

		["<C-f>"] = { "<cmd>silent !tmux neww tmux-sessionizer<CR>", "New tmux window" },
		["<C-k>"] = { "<cmd>cnext<CR>zz", "Next quickfix" },
		["<C-j>"] = { "<cmd>cprev<CR>zz", "Prev quickfix" },
		["<C-c>"] = { "<Esc>", "Exit insert mode" },
	}, {
		mode = { "n", "i", "v" },
	})
	which_key.register({
		s = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Substitute" },
	}, {
		prefix = "<leader>",
		mode = { "n", "v" },
	})
	which_key.register({
		J = { "<cmd>m '>+1<CR>gv=gv", "Move lines down" },
		K = { "<cmd>m '<-2<CR>gv=gv", "Move lines up" },
	}, {
		mode = "v",
	})
end

return M
