vim.cmd "colorscheme onedark"

-- Errors
vim.highlight.create('LspDiagnosticsVirtualTextError', { guifg = "Red", ctermfg = "Red", gui = "bold" }, false);
vim.highlight.create('DiagnosticVirtualTextError', { guifg = "Red", ctermfg = "Red", gui = "bold" }, false);

-- Warnings
vim.highlight.create('LspDiagnosticsVirtualTextWarning', { guifg = "Yellow", ctermfg = "Yellow" }, false);
vim.highlight.create('DiagnosticVirtualTextWarn', { guifg = "Yellow", ctermfg = "Yellow" }, false);

-- Info & Hints
vim.highlight.create('DiagnosticVirtualTextInfo', { guifg = "White", ctermfg = "White" }, false);
vim.highlight.create('DiagnosticVirtualTextHint', { guifg = "White", ctermfg = "White" }, false);

-- Comment in italics
vim.highlight.create('Comment', { gui = "italic", cterm = "italic" }, false);

-- Transparent background
local clear_group_bg = function(group, highlights)
  if group then
    if not highlights then
      highlights = vim.api.nvim_exec("highlight " .. group, true)
    end
  else
    if highlights then
      group = vim.split(highlights, " ")[1]
    else
      return
    end
  end
  if highlights:match("links to") then
    return
  end

  local term = highlights:match([[term=([%w#]+)]]) or "NONE"
  local ctermfg = highlights:match([[ctermfg=([%w#]+)]]) or "NONE"
  local gui = highlights:match([[gui=([%w#]+)]]) or "NONE"
  local guifg = highlights:match([[guifg=([%w#]+)]]) or "NONE"
  vim.cmd(
    string.format(
      "hi %s term=%s ctermfg=%s ctermbg=NONE gui=%s guifg=%s guibg=NONE",
      group,
      term,
      ctermfg,
      gui,
      guifg
    )
  )
end

local groups = {
  "Normal",
  "Comment",
  "Constant",
  "Special",
  "Identifier",
  "Statement",
  "PreProc",
  "Type",
  "Underlined",
  "Todo",
  "String",
  "Function",
  "Conditional",
  "Repeat",
  "Operator",
  "Structure",
  "LineNr",
  "NonText",
  "SignColumn",
  "CursorLineNr",
  "EndOfBuffer",
}

local clear_bg = function()
  for _, group in ipairs(groups) do
    clear_group_bg(group)
  end
end

clear_bg()

-- https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#how-to-add-visual-studio-code-dark-theme-colors-to-the-menu
-- completion colors
-- gray
vim.api.nvim_exec("highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080", true)
-- blue
vim.api.nvim_exec("highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6", true)
vim.api.nvim_exec("highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6", true)
-- light blue
vim.api.nvim_exec("highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE", true)
vim.api.nvim_exec("highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE", true)
vim.api.nvim_exec("highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE", true)
-- pink
vim.api.nvim_exec("highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0", true)
vim.api.nvim_exec("highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0", true)
-- front
vim.api.nvim_exec("highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4", true)
vim.api.nvim_exec("highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4", true)
vim.api.nvim_exec("highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4", true)
