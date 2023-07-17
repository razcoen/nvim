return {
  on_attach = function(client, bufnr)
    -- disable diagnostics when using helm
    if vim.bo[bufnr].buftype ~= "" or vim.bo[bufnr].filetype == "helm" then
      vim.diagnostic.disable(client, bufnr)
      vim.defer_fn(function()
        vim.diagnostic.reset(client, bufnr)
      end, 1000)
    end
  end,

  -- Server-specific settings. See `:help lspconfig-setup`
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
  }
}
