-- better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", {})
vim.keymap.set("n", "<C-j>", "<C-w>j", {})
vim.keymap.set("n", "<C-k>", "<C-w>k", {})
vim.keymap.set("n", "<C-l>", "<C-w>l", {})
vim.keymap.set("n", "<C-d>", ":bp|bd #<CR>", {})

-- resize with arrows
vim.keymap.set("n", "<S-Up>", ":resize -2<CR>", {})
vim.keymap.set("n", "<S-Down>", ":resize +2<CR>", {})
vim.keymap.set("n", "<S-Left>", ":vertical resize -2<CR>", {})
vim.keymap.set("n", "<S-Right>", ":vertical resize +2<CR>", {})

-- buffers
vim.keymap.set("n", "<Tab>", ":BufferNext<CR>", {})
vim.keymap.set("n", "<S-Tab>", ":BufferPrevious<CR>", {})
vim.keymap.set("n", "<S-q>", ":b#|bd#<CR>", {})
vim.keymap.set("n", "<C-q>", ":q<CR>", {})

-- search
vim.keymap.set("n", "<CR>", ":set hlsearch!<CR>", {})

-- stay in indent mode
vim.keymap.set("v", "<", "<gv", {})
vim.keymap.set("v", ">", ">gv", {})

-- dont yank on delete char
vim.keymap.set("n", "x", '"_x', {})
vim.keymap.set("n", "X", '"_X', {})
vim.keymap.set("v", "x", '"_x', {})
vim.keymap.set("v", "X", '"_X', {})

-- dont yank on visual paste
vim.keymap.set("v", "p", '"_dP', {})

-- save file by CTRL-S
vim.keymap.set("n", "<C-s>", ":w!<CR>", {})
vim.keymap.set("i", "<C-s>", "<ESC> :w!<CR>", {})

-- make word uppercase
vim.keymap.set("n", "<C-u>", "viwU<ESC>", {})
vim.keymap.set("i", "<C-u>", "<ESC>viwUi", {})
