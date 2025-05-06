vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.guicursor = "n-v-c-sm:block,i-ci-ve:block-blinkwait0-blinkon400-blinkoff250"
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.incsearch = true
opt.inccommand = "split"

-- search settings
opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

-- styling
opt.termguicolors = true
opt.scrolloff = 8
opt.signcolumn = "yes"

-- backspace
opt.backspace = { "start", "eol", "indent" }

--split windows
opt.splitright = true
opt.splitbelow = true

opt.isfname:append("@-@")
opt.updatetime = 50
opt.colorcolumn = "80"

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard

opt.hlsearch = true

opt.mouse = "a"

-- Enable folding ( setup in nvim-ufo )
vim.o.foldenable = true
vim.o.foldmethod = "manual"
vim.o.foldlevel = 99
vim.o.foldcolumn = "0"
