require("null-ls").setup({
  debug = true,
  sources = {
    require("null-ls").builtins.formatting.eslint_d,
    require("null-ls").builtins.diagnostics.eslint,
    require("null-ls").builtins.completion.spell,
  },
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd([[
      augroup LspFormatting
        autocmd! * <buffer>
        autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
      augroup END
      ]])
    end
  end,
})

-- eslint_d installation
os.execute('npm ls -g eslint_d || npm i -g eslint_d')
