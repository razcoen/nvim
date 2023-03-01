
lsp_handlers = require('lsp.handlers')

lsp_handlers.setup()

local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
  vim.notify("Problem with mason-lspconfig")
  return
end

mason_lspconfig.setup {
  automatic_installation = true
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("Problems with lspconfig")
  return
end

local on_attach = function(client, bufnr)
  lsp_handlers.fix_helm(bufnr)
end

mason_lspconfig.setup_handlers {
    -- This is a default handler that will be called for each installed server (also for new servers that are installed during a session)
  function (server_name)
    lspconfig[server_name].setup {
      on_attach = on_attach,
      flags = lsp_flags,
    }
  end,
}

require('lsp_extensions').inlay_hints{
	highlight = "Comment",
	prefix = " > ",
	aligned = false,
	only_current_line = false,
	enabled = { "TypeHint", "ChainingHint", "ParameterHint" }
}
