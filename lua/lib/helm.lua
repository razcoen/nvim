local disable_diagnostics = function(client, bufnr)
  if vim.bo[bufnr].filetype == "helm" then
    vim.diagnostic.disable(client, bufnr)
    vim.defer_fn(function() vim.diagnostic.reset(client, bufnr) end, 1000)
  end
end

return {
  disable_diagnostics
}
