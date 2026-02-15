vim.g.mapleader = "\\"
vim.g.gitdir = "~/git"

vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.shell = "zsh"

vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.clipboard = "unnamedplus"

vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevelstart = 99

vim.opt.updatetime = 50
vim.o.autoread = true

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  command = "if mode() != 'c' | checktime | endif",
})

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.guicursor = ""

vim.opt.termguicolors = true

vim.opt.wrap = false

vim.opt.hlsearch = true

vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.shortmess:append("c")
vim.opt.isfname:append("@-@")

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[silent! set iskeyword+=-]]
vim.cmd [[silent! set spellsuggest]]
vim.cmd [[silent! set spell]]
