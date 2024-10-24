local M = {
	"lewis6991/gitsigns.nvim",
	event = "BufEnter",
	cmd = "Gitsigns",
}
M.config = function()
	local icons = require("user.icons")
	local gitsigns = require("gitsigns")

	local wk = require("which-key")
	wk.register({
    name = "Git",
		j = {
			function()
				gitsigns.next_hunk({ navigation_message = false })
			end,
			"Next Hunk",
		},
		k = {
			function()
				gitsigns.prev_hunk({ navigation_message = false })
			end,
			"Prev Hunk",
		},
		p = { gitsigns.preview_hunk, "Preview Hunk" },
		r = { gitsigns.reset_hunk, "Reset Hunk" },
		l = { gitsigns.blame_line, "Blame" },
		R = { gitsigns.reset_buffer, "Reset Buffer" },
		s = { gitsigns.stage_hunk, "Stage Hunk" },
		u = {
			gitsigns.undo_stage_hunk,
			"Undo Stage Hunk",
		},
		d = {
			"<cmd>Gitsigns diffthis HEAD<cr>",
			"Git Diff",
		},
	}, { mode = "n", prefix = "<leader>g" })

	require("gitsigns").setup({
		signs = {
			add = {
				hl = "GitSignsAdd",
				text = icons.ui.BoldLineMiddle,
				numhl = "GitSignsAddNr",
				linehl = "GitSignsAddLn",
			},
			change = {
				hl = "GitSignsChange",
				text = icons.ui.BoldLineDashedMiddle,
				numhl = "GitSignsChangeNr",
				linehl = "GitSignsChangeLn",
			},
			delete = {
				hl = "GitSignsDelete",
				text = icons.ui.TriangleShortArrowRight,
				numhl = "GitSignsDeleteNr",
				linehl = "GitSignsDeleteLn",
			},
			topdelete = {
				hl = "GitSignsDelete",
				text = icons.ui.TriangleShortArrowRight,
				numhl = "GitSignsDeleteNr",
				linehl = "GitSignsDeleteLn",
			},
			changedelete = {
				hl = "GitSignsChange",
				text = icons.ui.BoldLineMiddle,
				numhl = "GitSignsChangeNr",
				linehl = "GitSignsChangeLn",
			},
		},
		watch_gitdir = {
			interval = 1000,
			follow_files = true,
		},
		attach_to_untracked = true,
		current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
		update_debounce = 200,
		max_file_length = 40000,
		preview_config = {
			border = "rounded",
			style = "minimal",
			relative = "cursor",
			row = 0,
			col = 1,
		},
	})
end

return {}
-- return M
