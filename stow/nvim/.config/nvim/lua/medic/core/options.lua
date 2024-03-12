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

-- clipboard -- Possibliy iffy?
opt.clipboard:append("unnamedplus")

-- splitting windows
opt.splitright = true
opt.splitbelow = true

-- Adds - to word characters 
opt.iskeyword:append("-")

-- Wrapping
opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.config/nvim-undodir"
opt.undofile = true

opt.scrolloff = 8
opt.isfname:append("@-@")

opt.updatetime = 50

opt.colorcolumn = "80"

vim.g.mapleader = " "

