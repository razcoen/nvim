return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      delay = 300,
      spec = {
        { "<leader>c", group = "code" },
        { "<leader>f", group = "find" },
        { "<leader>l", group = "live" },
        { "<leader>g", group = "grep" },
      },
    },
  },
}
