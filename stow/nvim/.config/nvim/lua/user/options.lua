local opt = vim.opt;

-- line numbers
opt.nu = true
opt.rnu = true

-- tabs, indentations
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
-- opt.softtabstop = 2
-- opt.smartindent = true

-- search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- cursor line
opt.cursorline = true

-- apperance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
-- backspace
opt.backspace = "indent,eol,start"
opt.backup = false -- creates a backup file
opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
opt.title = true -- title update
opt.showtabline = 1 -- always show tabs
opt.smartcase = true -- smart case
opt.smartindent = true -- make indenting smarter again
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window
opt.swapfile = false -- creates a swapfile
opt.termguicolors = true -- set term gui colors (most terminals support this)
opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
opt.undofile = true -- enable persistent undo
opt.updatetime = 100 -- faster completion (4000ms default)
opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
opt.expandtab = true -- convert tabs to spaces
opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
opt.tabstop = 2 -- insert 2 spaces for a tab
opt.cursorline = true -- highlight the current line
opt.number = true -- set numbered lines
opt.laststatus = 3
opt.showcmd = false
opt.ruler = false
opt.relativenumber = true -- set relative numbered lines
opt.numberwidth = 4 -- set number column width to 2 {default 4}

-- Adds - to word characters 
opt.iskeyword:append("-")

-- Wrapping
opt.wrap = false

opt.undodir = os.getenv("HOME") .. "/.config/nvim-undodir"
opt.undofile = true

opt.scrolloff = 8
opt.isfname:append("@-@")

opt.updatetime = 50

opt.colorcolumn = "80"

vim.g.mapleader = " "

