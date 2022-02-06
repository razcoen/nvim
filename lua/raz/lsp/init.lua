local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "raz.lsp.lsp-installer"
require("raz.lsp.handlers").setup()
require "raz.lsp.null-ls"
