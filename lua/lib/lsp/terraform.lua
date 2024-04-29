local M = {}

function M.fix_terraform_vars_filetype(client, bufnr) 
  if vim.bo[bufnr].filetype == "terraform-vars" then
    vim.bo[bufnr].filetype = "terraform"
  end
end

return M
