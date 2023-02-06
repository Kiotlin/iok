local opt = vim.opt

opt.backup = false
opt.clipboard = "unnamedplus"
opt.cmdheight = 1
opt.completeopt = { "menuone", "noselect" }
opt.conceallevel = 0
opt.fileencoding = "utf-8"
opt.hlsearch = true
opt.ignorecase = true
opt.mouse = "a"
opt.pumheight = 10 -- pop up menu height
opt.showmode = true -- hide something like '-- INSERT --'
opt.showtabline = 2
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.termguicolors = true
opt.timeoutlen = 300
opt.undofile = true
opt.updatetime = 300
opt.writebackup = false
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.cursorline = true
opt.number = true
opt.relativenumber = false
opt.numberwidth = 4
opt.signcolumn = "yes"
opt.wrap = true
opt.linebreak = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.whichwrap = "bs<>[]hl"

opt.shortmess:append "c"
opt.runtimepath:remove("/usr/share/vim/vimfiles")

vim.cmd "set whichwrap+=<,>,[,],h,l"

