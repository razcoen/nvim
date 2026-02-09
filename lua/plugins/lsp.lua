return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      { 'towolf/vim-helm' },
    },
    config = function()
      require("mason").setup()
      local mason_lspconfig = require('mason-lspconfig')
      mason_lspconfig.setup({
        automatic_installation = true,
      })

      local helm = require('lib.lsp.helm')
      local terraform = require('lib.lsp.terraform')
      helm.setup()

      -- ------------------------------------------------------------
      -- Completion, diagnostics and keymaps for LSP related commands
      -- ------------------------------------------------------------
      vim.lsp.config('*', {
        on_attach = function(client, bufnr)
          local opts = { buffer = bufnr, remap = false }
          vim.keymap.set("n", "gd", function() require('telescope.builtin').lsp_definitions() end, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
          vim.keymap.set("n", "gt", function() require('telescope.builtin').lsp_type_definitions() end, vim.tbl_extend("force", opts, { desc = "Go to type definition" }))
          vim.keymap.set("n", "gr", function() require('telescope.builtin').lsp_references() end, vim.tbl_extend("force", opts, { desc = "Go to references" }))
          vim.keymap.set("n", "gi", function() require('telescope.builtin').lsp_implemenetations()() end, vim.tbl_extend("force", opts, { desc = "Go to implementations" }))
          vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, vim.tbl_extend("force", opts, { desc = "Open diagnostics" }))
          vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, vim.tbl_extend("force", opts, { desc = "Hover documentation" }))
          vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, vim.tbl_extend("force", opts, { desc = "Signature help" }))
          vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, vim.tbl_extend("force", opts, { desc = "Code action" }))
          vim.keymap.set("n", "<leader>cr", function() vim.lsp.buf.rename() end, vim.tbl_extend("force", opts, { desc = "Rename symbol" }))
          vim.keymap.set("n", "<leader>cf", function() vim.lsp.buf.format() end, vim.tbl_extend("force", opts, { desc = "Format" }))
          vim.keymap.set("v", "<leader>ca", function() vim.lsp.buf.range_code_action() end, vim.tbl_extend("force", opts, { desc = "Code action" }))
          vim.keymap.set("v", "<leader>cf", function() vim.lsp.buf.range_formatting() end, vim.tbl_extend("force", opts, { desc = "Format" }))
          helm.disable_diagnostics(client, bufnr)
          terraform.fix_terraform_vars_filetype(client, bufnr)
        end,
        capabilities = require('cmp_nvim_lsp').default_capabilities()
      })

      -- ------------------------------------------------------------
      -- Language specific configurations
      -- ------------------------------------------------------------
      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
      }})

      -- ------------------------------------------------------------
      -- Hover configuration
      -- ------------------------------------------------------------
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
      })
      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
      })
    end,
  },
}
