local M = {
	"ahmedkhalf/project.nvim",
	event = "VeryLazy",
	dependencies = {
		"folke/which-key.nvim",
	},
}

function M.config()
	require("project_nvim").setup({
		active = true,
		on_config_done = nil,
		manual_mode = false,
		detection_methods = { "pattern" },
		patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "pom.xml" },
		ignore_lsp = {},
		exclude_dirs = {},
		show_hidden = false,
		silent_chdir = true,
		scope_chdir = "global",
	})

	local wk = require("which-key")
	wk.register({
		["<c-p>"] = {
			require("telescope").extensions.projects.projects,
			"Search projects",
		},
	}, { mode = "n" })
end

return M
