return {
  {
    "razcoen/fleet.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd([[ colorscheme fleet ]])
    end,
  },
  {
    "xiyaowong/transparent.nvim",
    config = function()
      vim.cmd([[ TransparentEnable ]])
    end,
  }
}
