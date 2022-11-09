local M = {}

M.setup = function()
  local signs = {
    -- { name = "DiagnosticSignError", text = "" },
    -- { name = "DiagnosticSignWarn", text = "" },
    -- { name = "DiagnosticSignHint", text = "" },
    -- { name = "DiagnosticSignInfo", text = "" },
    { name = "DiagnosticSignError", text = "E" },
    { name = "DiagnosticSignWarn", text = "W" },
    { name = "DiagnosticSignHint", text = "H" },
    { name = "DiagnosticSignInfo", text = "I" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    -- disable virtual text
    virtual_text = true,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]] ,
      false
    )
  end
end

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>",
    { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua require'telescope.builtin'.lsp_references()<CR>",
    { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua require'telescope.builtin'.lsp_implementations()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>",
    { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(bufnr, "v", "<leader>ca", "<cmd>'<,'>lua vim.lsp.buf.range_code_action()<CR>",
    { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>",
    { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>cf", "<cmd>Format<CR>", { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(bufnr, "v", "<leader>cf", "<cmd>'<.'>lua vim.lsp.buf.range_formatting()<CR>",
    { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(bufnr, "n", "L", "<cmd>lua vim.lsp.buf.signature_help()<CR>",
    { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(bufnr, "n", "]g",
    "<cmd>lua vim.diagnostic.goto_next({ float = { border = 'rounded' }})<CR>", { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(bufnr, "n", "[g",
    "<cmd>lua vim.diagnostic.goto_prev({ float = { border = 'rounded' }})<CR>", { noremap = true, silent = true })
end

local function setup_format()
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting_seq_sync()' ]]
  -- vim.api.nvim_exec([[
  --   augroup fmt
  --     autocmd! * <buffer>
  --     autocmd BufWritePre <buffer> Format
  --   augroup END
  -- ]], false)
end

local function handle_js(client)
  if client.name == "tsserver" then
    client.resolved_capabilities.document_formatting = false
  end
  -- vim.api.nvim_exec(
  --   [[
  --   augroup fmt_js
  --     autocmd! * <buffer>
  --     autocmd BufWritePre *.ts EslintFixAll
  --     autocmd BufWritePre *.tsx EslintFixAll
  --     autocmd BufWritePre *.js EslintFixAll
  --     autocmd BufWritePre *.jsx EslintFixAll
  --   augroup END
  -- ]] ,
  --   false
  -- )
end

local function fix_helm(bufnr)
  if vim.bo[bufnr].buftype ~= "" or vim.bo[bufnr].filetype == "helm" then
      vim.diagnostic.disable(bufnr)
      vim.defer_fn(function()
        vim.diagnostic.reset(nil, bufnr)
      end, 1000)
    end
end

M.on_attach = function(client, bufnr)
  fix_helm(bufnr)
  setup_format()
  lsp_keymaps(bufnr)
  -- lsp_highlight_document(client)
  handle_js(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

return M
