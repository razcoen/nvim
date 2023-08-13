local M = {}

function M.disable_diagnostics(client, bufnr)
  if vim.bo[bufnr].buftype ~= "" or vim.bo[bufnr].filetype == "helm" then
    vim.diagnostic.disable(bufnr)
    vim.defer_fn(function()
      vim.diagnostic.reset(nil, bufnr)
    end, 1000)
  end
end

function M.setup()
  local utils = require("lib.utils")
  vim.filetype.add({
    extension = {
      yaml = utils.yaml_filetype,
      yml = utils.yaml_filetype,
      tmpl = utils.tmpl_filetype,
      tpl = utils.tpl_filetype
    },
    filename = {
      ["Chart.yaml"] = "yaml",
      ["Chart.lock"] = "yaml",
    }
  })


  local events = { "BufNewFile", "BufRead" }
  local au_helm = vim.api.nvim_create_augroup("Helm", {})
  vim.api.nvim_create_autocmd(events, {
    pattern = "helm*",
    group = au_helm,
    command = "setlocal commentstring={{/*\\ %s\\ */}}",
  })
end

return M
