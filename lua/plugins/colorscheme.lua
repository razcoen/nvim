return {
  {
    "felipeagc/fleet-theme-nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd([[colorscheme fleet]])
      -- sets the hover window background to regular background
      vim.cmd([[highlight link NormalFloat Normal]])
      -- completion colors
      vim.api.nvim_exec("highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080", true)
      vim.api.nvim_exec("highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6", true)
      vim.api.nvim_exec("highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6", true)
      vim.api.nvim_exec("highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE", true)
      vim.api.nvim_exec("highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE", true)
      vim.api.nvim_exec("highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE", true)
      vim.api.nvim_exec("highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0", true)
      vim.api.nvim_exec("highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0", true)
      vim.api.nvim_exec("highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4", true)
      vim.api.nvim_exec("highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4", true)
      vim.api.nvim_exec("highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4", true)
    end,
  },
}
