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
  local function is_helm_file(path)
    local check = vim.fs.find("Chart.yaml", { path = vim.fs.dirname(path), upward = true })
    return not vim.tbl_isempty(check)
  end

  local function is_yaml_filetype(path, bufname)
    return is_helm_file(path) and "helm.yaml" or "yaml"
  end

  local function is_tmpl_filetype(path, bufname)
    return is_helm_file(path) and "helm.tmpl" or "template"
  end

  local function is_tpl_filetype(path, bufname)
    return is_helm_file(path) and "helm.tmpl" or "smarty"
  end

  vim.filetype.add({
    extension = {
      yaml = is_yaml_filetype,
      yml = is_yaml_filetype,
      tmpl = is_tmpl_filetype,
      tpl = is_tpl_filetype
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
