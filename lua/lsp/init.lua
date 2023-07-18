require("mason").setup()
local mason_lspconfig = require('mason-lspconfig')
mason_lspconfig.setup { automatic_installation = true }
-- Hook mason-lspconfig into lspconfig.
local lspconfig = require('lspconfig')
local handlers = require('lsp.handlers')
mason_lspconfig.setup_handlers {
  -- This is a default handler that will be called for each installed server (also for new servers that are installed during a session)
  function(server_name)
    lspconfig[server_name].setup {
      settings = handlers.settings,
      on_attach = handlers.on_attach,
      capabilities = handlers.capabilities
    }
  end,
}

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Rounded borders on hover windows.
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded", })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded", })
