return {
	-- change some telescope options and a keymap to browse plugin files
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			config = function()
				require("telescope").load_extension("fzf")
			end,
		},
		{ "nvim-lua/plenary.nvim" },
		{ "folke/which-key.nvim" },
		{ "nvim-telescope/telescope-ui-select.nvim" },
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local actions = require("telescope.actions")
		telescope.setup({
			defaults = {
				layout_strategy = "horizontal",
				layout_config = { prompt_position = "top" },
				sorting_strategy = "ascending",
				winblend = 0,
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
			},
		})
		telescope.load_extension("ui-select")
		telescope.load_extension("fzf")
		require("which-key").register({
			["<leader>"] = {
				f = {
					name = "Find",
					f = { builtin.find_files, "Find file" },
					s = { builtin.live_grep, "Find string" },
					c = { builtin.rep_string, "Find current string under the cursor" },
					b = { builtin.buffers, "Find buffer" },
					g = {
						name = "Git",
						s = { builtin.git_status, "Git status" },
						c = {
							function()
								builtin.git_commits({
									git_command = {
										"git",
										"hist",
									},
								})
							end,
							"Git commits",
						},
						b = { builtin.git_branches, "Git branches" },
						r = { builtin.git_bcommits, "Git bcommits" },
					},
					h = { builtin.help_tags, "Help tags" },
					r = { builtin.oldfiles, "Find recent" },
				},
			},
		})
	end,
}
