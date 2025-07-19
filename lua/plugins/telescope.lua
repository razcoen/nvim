return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
    },
    config = function()
      local builtin = require('telescope.builtin')
      local utils = require('telescope.utils')
      local find_command = function()
        return { 'fd', '--type', 'f', '--color=never', '--hidden', '--follow' }
      end
      local project_files = function(opts)
        local _, ret, _ = utils.get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' })
        if ret == 0 then
          builtin.git_files(opts)
        else
          builtin.find_files(opts)
        end
      end

      vim.keymap.set('n', '<leader>g', function() builtin.grep_string({ search = vim.fn.input("Grep > ") }) end)
      vim.keymap.set('n', '<leader>lg', function() builtin.live_grep({}) end, {})
      vim.keymap.set('n', 'gs', function() builtin.live_grep({}) end, {})
      vim.keymap.set('n', '<leader>fg', function() project_files({ find_command = find_command }) end, {})
      vim.keymap.set('n', 'gf', function() project_files({ find_command = find_command }) end, {})
      vim.keymap.set('n', '<leader>ff',
        function() builtin.find_files({ find_command = find_command, search_dirs = { vim.g.gitdir } }) end, {})
      vim.keymap.set("n", "<leader>fb", function() builtin.buffers({}) end, {})
      vim.keymap.set("n", "<leader>fh", function() builtin.help_tags({}) end, {})
      vim.keymap.set('n', '<leader>fk', function() builtin.keymaps({}) end, {})

      require('telescope').setup({
        defaults = {
          layout_config = {
            prompt_position = 'top',
            flex = { width = 0.9 },
            horizontal = { width = 0.9 }
          },
          sorting_strategy = 'ascending',
        },
      })
    end,
  },
}
