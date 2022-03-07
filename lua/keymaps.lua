local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
-- keymap("", "<Space>", "<Nop>", opts)
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

-- Modes normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-d>", ":bp|bd #<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>fg", "<cmd>lua require'telescope.builtin'.git_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>fb", "<cmd>lua require'telescope.builtin'.buffers(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>g", "<cmd>Telescope live_grep<cr>", opts)

-- Tree
keymap("n", "<C-f>", ":NvimTreeToggle<cr>", opts)

-- Trouble
keymap("n", "<C-t>", ":TroubleToggle<cr>", opts)

-- Floaterm
keymap("n", "<C-\\>", ":FloatermToggle<cr>", opts)
keymap("t", "<Esc>", "<C-\\><C-n>", opts)
keymap("t","<C-\\>","<C-\\><C-n>:FloatermToggle<CR>", opts)
keymap("t","<C-n>","<C-\\><C-n>:FloatermNew<CR>", opts)
keymap("t","<C-q>","<C-\\><C-n>:FloatermKill<CR>", opts)
keymap("t","<C-k>","<C-\\><C-n>:FloatermNext<CR>", opts)
keymap("t","<C-j>","<C-\\><C-n>:FloatermPrev<CR>", opts)
vim.api.nvim_exec(
[[
let g:floaterm_width = 0.9
let g:floaterm_height = 0.7
]], true)

-- Resize with arrows
keymap("n", "<S-Up>", ":resize -2<CR>", opts)
keymap("n", "<S-Down>", ":resize +2<CR>", opts)
keymap("n", "<S-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<S-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<C-o>", ":bnext<CR>", opts)
keymap("n", "<C-i>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "p", '"_dP', opts)
