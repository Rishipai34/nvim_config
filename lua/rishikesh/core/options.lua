local opt = vim.opt --for consiceness 
vim.cmd("let g:netwr_liststyle = 3")

-- line numbers 

opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrap 
opt.wrap = false

--search settings 
opt.ignorecase = true
opt.smartcase = true

--cursorline 
opt.cursorcolumn = true
opt.cursorline = true

--apearance 
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

--backspace 
opt.backspace = "indent,eol,start"

--clipboard
opt.clipboard:append("unnamedplus")

--split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")
