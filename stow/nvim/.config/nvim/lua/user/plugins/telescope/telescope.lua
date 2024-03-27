local M = {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			lazy = true,
		},
		{ "folke/which-key.nvim" },
	},
	lazy = true,
	cmd = "Telescope",
}

function M.config()
	local wk = require("which-key")
	local telescope = require("telescope")
	local builtin = require("telescope.builtin")
	local icons = require("user.icons")
	local actions = require("telescope.actions")

	wk.register({
		["<leader>b"] = {
			name = "Buffers",
		},
		["<leader>bb"] = {
			function()
				builtin.buffers({
					previewer = false,
				})
			end,
			"Find buffer",
		},

		["<leader>f"] = {
			name = "Find",
		},
		["<leader>fb"] = { builtin.buffers, "Find buffer" },
		["<leader>fc"] = { builtin.colorscheme, "Select Colorscheme" },
		["<leader>ff"] = { builtin.find_files, "Find files" },
		["<leader>fp"] = { telescope.extensions.projects.projects, "Projects" },
		["<leader>ft"] = { builtin.live_grep, "Find Text" },
		["<leader>fs"] = { builtin.grep_string, "Find String" },
		["<leader>fh"] = { builtin.help_tags, "Help" },
		["<leader>fH"] = { builtin.highlights, "Highlights" },
		-- ["<leader>fi"] = {telescope.extensions.media_files.media_files, "Media"},
		["<leader>fl"] = { builtin.resume, "Last Search" },
		["<leader>fM"] = { builtin.man_pages, "Man Pages" },
		["<leader>fr"] = { builtin.oldfiles, "Recent File" },
		["<leader>fR"] = { builtin.registers, "Registers" },
		["<leader>fk"] = { builtin.keymaps, "Keymaps" },
		["<leader>fC"] = { builtin.commands, "Commands" },

		["<leader>g"] = {
			name = "Git",
		},
		["<leader>go"] = { builtin.git_status, "Open changed file" },
		["<leader>gb"] = { builtin.git_branches, "Checkout branch" },
		["<leader>gc"] = { builtin.git_commits, "Checkout commit" },
		["<leader>gC"] = { builtin.git_bcommits, "Checkout commit(for current file)" },

	})

	-- Highlight parent directories in telescope results
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "TelescopeResults",
		callback = function(ctx)
			vim.api.nvim_buf_call(ctx.buf, function()
				vim.fn.matchadd("TelescopeParent", "\t\t.*$")
				vim.api.nvim_set_hl(0, "TelescopeParent", {
					link = "Comment",
				})
			end)
		end,
	})

	-- Helper function for sorting
	local function filenameFirst(_, path)
		local tail = vim.fs.basename(path)
		local parent = vim.fs.dirname(path)
		if parent == "." then
			return tail
		end
		return string.format("%s\t\t%s", tail, parent)
	end

	telescope.setup({
		defaults = {
			prompt_prefix = icons.ui.Telescope .. " ",
			selection_caret = icons.ui.Forward .. "  ",
			entry_prefix = "   ",
			initial_mode = "insert",
			selection_strategy = "reset",
			path_display = { "smart" },
			color_devicons = true,
			set_env = {
				["COLORTERM"] = "truecolor",
			},
			sorting_strategy = nil,
			layout_strategy = nil,
			layout_config = {},
			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
				"--hidden",
				"--glob=!.git/",
			},

			mappings = {
				i = {
					["<C-n>"] = actions.cycle_history_next,
					["<C-p>"] = actions.cycle_history_prev,

					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,

					["<C-v>"] = actions.file_vsplit,
					["<C-s>"] = actions.file_split,
				},
				n = {
					["<esc>"] = actions.close,
					["j"] = actions.move_selection_next,
					["k"] = actions.move_selection_previous,
					["q"] = actions.close,
					["v"] = actions.file_vsplit,
				},
			},
		},
		pickers = {
			live_grep = {
				theme = "dropdown",
			},

			grep_string = {
				theme = "dropdown",
			},

			find_files = {
				theme = "dropdown",
				previewer = false,
				path_display = filenameFirst,
				hidden = true,
			},

			buffers = {
				theme = "dropdown",
				previewer = false,
				initial_mode = "normal",
				mappings = {
					i = {
						["<C-d>"] = actions.delete_buffer,
					},
					n = {
						["dd"] = actions.delete_buffer,
					},
				},
			},

			planets = {
				show_pluto = true,
				show_moon = true,
			},

			colorscheme = {
				enable_preview = true,
			},

			lsp_references = {
				theme = "dropdown",
				initial_mode = "normal",
			},

			lsp_definitions = {
				theme = "dropdown",
				initial_mode = "normal",
			},

			lsp_declarations = {
				theme = "dropdown",
				initial_mode = "normal",
			},

			lsp_implementations = {
				theme = "dropdown",
				initial_mode = "normal",
			},
		},
		extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			},
			["ui-select"] = { require("telescope.themes").get_dropdown({}) },
		},
	})
end

return M
