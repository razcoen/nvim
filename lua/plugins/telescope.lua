return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
    },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>g', function() builtin.grep_string({ search = vim.fn.input("Grep > ") }) end)
      vim.keymap.set('n', '<leader>lg', function() builtin.live_grep({}) end, {})
      vim.keymap.set('n', '<leader>ff', function() builtin.find_files({ no_ignore = true }) end, {})
      vim.keymap.set('n', '<leader>fg', function() builtin.git_files({}) end, {})
      vim.keymap.set("n", "<leader>fb", function() builtin.buffers({}) end, {})
      vim.keymap.set("n", "<leader>fh", function() builtin.help_tags({}) end, {})
      vim.keymap.set('n', '<leader>fk', function() builtin.keymaps({}) end, {})
    end,
  },

}
