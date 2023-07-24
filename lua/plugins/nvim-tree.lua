local nvim_tree = require('nvim-tree')
nvim_tree.setup {
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  git = {
    enable = false,
    ignore = false,
    timeout = 500,
  },
}

vim.keymap.set("n", "<C-f>", ":NvimTreeToggle<CR>", {})
