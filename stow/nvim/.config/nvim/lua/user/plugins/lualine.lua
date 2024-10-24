local M = {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        opt = true
    },
    event = "VeryLazy"
}

function M.config()
    local icons = require "user.icons"
    local lualine = require "lualine"
    local lazy_status = require "lazy.status"
    local diff = {
        "diff",
        colored = false,
        symbols = {
            added = icons.git.LineAdded,
            modified = icons.git.LineModified,
            removed = icons.git.LineRemoved
        } -- Changes the symbols used by the diff.
    }
    local diagnostics = {
        "diagnostics",
        sections = {"error", "warn"},
        colored = false, -- Displays diagnostics status in color if set to true.
        always_visible = true -- Show diagnostics even if there are none.
    }
    local function filetype()
        local filetype = vim.bo.filetype
        local upper_case_filetypes = {"json", "jsonc", "yaml", "toml", "css", "scss", "html", "xml"}

        if vim.tbl_contains(upper_case_filetypes, filetype) then
            return filetype:upper()
        end

        return filetype
    end

    lualine.setup({
        options = {
            -- component_separators = { left = "", right = "" },
            -- section_separators = { left = "", right = "" },
            -- component_separators = { left = "", right = "" },
            -- section_separators = { left = "", right = "" },

            ignore_focus = {"NvimTree", "netrw"}
        },
        theme = "catppuccin",
        sections = {
            lualine_a = {"mode"},
            lualine_b = {'branch', 'diff', diagnostics},
            lualine_c = {'filename'},
            -- lualine_x = {"copilot", filetype},
            lualine_x = {"copilot", 'encoding', 'fileformat', filetype},
            lualine_y = {"progress"},
            lualine_z = {{
                lazy_status.updates,
                cond = lazy_status.has_updates,
                color = {
                    fg = "#ff9e64"
                }
            }, "location"}
        }

    })
end

return M
