vim.g.gruvbox_contrast_dark = 'hard'
vim.cmd("colorscheme gruvbox")

-- Sets the hover window background to regular background
vim.cmd [[ highlight link NormalFloat Normal ]]

-- Errors
vim.api.nvim_exec("highlight! LspDiagnosticsVirtualTextError guifg=Red gui=bold", false)
vim.api.nvim_exec("highlight! DiagnosticVirtualTextError guifg=Red gui=bold", false)

-- Warnings
vim.api.nvim_exec("highlight! LspDiagnosticsVirtualTextWarning guifg=Yellow", false)
vim.api.nvim_exec("highlight! DiagnosticVirtualTextWarn guifg=Yellow", false)

-- Info & Hints
vim.api.nvim_exec("highlight! DiagnosticVirtualTextInfo guifg=White", false)
vim.api.nvim_exec("highlight! DiagnosticVirtualTextHint guifg=White", false)

-- Completion colors
vim.api.nvim_exec("highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080", true)
vim.api.nvim_exec("highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6", true)
vim.api.nvim_exec("highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6", true)
vim.api.nvim_exec("highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE", true)
vim.api.nvim_exec("highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE", true)
vim.api.nvim_exec("highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE", true)
vim.api.nvim_exec("highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0", true)
vim.api.nvim_exec("highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0", true)
vim.api.nvim_exec("highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4", true)
vim.api.nvim_exec("highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4", true)
vim.api.nvim_exec("highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4", true)
