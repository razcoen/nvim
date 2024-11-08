return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      { 'towolf/vim-helm' },
      { 'saghen/blink.cmp' },
    },
    config = function()
      require("mason").setup()

      local mason_lspconfig = require('mason-lspconfig')
      local lspconfig = require('lspconfig')
      mason_lspconfig.setup({
        automatic_installation = true,
        ensure_installed = {
          "bashls",
          "bufls",
          "cmake",
          "dockerls",
          "docker_compose_language_service",
          "earthlyls",
          "gradle_ls",
          "graphql",
          "helm_ls",
          "jsonls",
          "jqls",
          "kotlin_language_server",
          "lua_ls",
          "autotools_ls", -- make
          "marksman",
          "spectral",
          "perlnavigator",
          "powershell_es",
          "pyright",
          "pylsp",
          "sqlls",
          "taplo", -- toml
          "terraformls",
          "tflint",
          "vimls",
          "yamlls",

          "java_language_server",
          "rust_analyzer",

          "cssls",
          "cssmodules_ls",
          "denols",
          "eslint",
          "ember",
          "html",
          "htmx",
          "tsserver",
          "tailwindcss",
          "vuels",

          "golangci_lint_ls",
          "gopls",
        }
      })

      local helm = require('lib.lsp.helm')
      local terraform = require('lib.lsp.terraform')
      helm.setup()

      mason_lspconfig.setup_handlers({
        function(server_name)
          lspconfig[server_name].setup {
            settings = {
              gopls = {
                hints = {
                  assignVariableTypes = true,
                  compositeLiteralFields = true,
                  compositeLiteralTypes = true,
                  constantValues = true,
                  functionTypeParameters = true,
                  parameterNames = true,
                  rangeVariableTypes = true,
                },
              },
              Lua = {
                diagnostics = {
                  globals = { 'vim' },
                },
              },
            },
            on_attach = function(client, bufnr)
              local opts = { buffer = bufnr, remap = false }
              vim.keymap.set("n", "gd", function() require('telescope.builtin').lsp_definitions() end, opts)
              vim.keymap.set("n", "gt", function() require('telescope.builtin').lsp_type_definitions() end, opts)
              vim.keymap.set("n", "gr", function() require('telescope.builtin').lsp_references() end, opts)
              vim.keymap.set("n", "gi", function() require('telescope.builtin').lsp_implemenetations()() end, opts)
              vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts)
              vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
              vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
              vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
              vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
              vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
              vim.keymap.set("n", "<leader>cr", function() vim.lsp.buf.rename() end, opts)
              vim.keymap.set("n", "<leader>cf", function() vim.lsp.buf.format() end, opts)
              vim.keymap.set("v", "<leader>ca", function() vim.lsp.buf.range_code_action() end, opts)
              vim.keymap.set("v", "<leader>cf", function() vim.lsp.buf.range_formatting() end, opts)
              helm.disable_diagnostics(client, bufnr)
              terraform.fix_terraform_vars_filetype(client, bufnr)
            end,
            capabilities = require('blink.cmp').get_lsp_capabilities(require('cmp_nvim_lsp').default_capabilities())
          }
        end,
      })

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded", })
      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help,
        { border = "rounded", })
    end,
  },
  { -- comments keymaps: "gcc" line, "gc" block
    'numToStr/Comment.nvim',
    config = function() require('Comment').setup({}) end
  },
}
