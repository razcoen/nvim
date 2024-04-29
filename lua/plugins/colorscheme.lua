return {
  {
    "morhetz/gruvbox",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd([[colorscheme gruvbox]])
      vim.cmd([[highlight link NormalFloat Normal]]) -- sets the hover window background to regular background
    end,
  },
}
