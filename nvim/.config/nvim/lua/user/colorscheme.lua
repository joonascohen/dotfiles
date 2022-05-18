vim.cmd [[
try
  colorscheme gruvbox
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
-- vim.cmd [[
-- highlight Normal guibg=none
-- highlight NonText guibg=none
-- highlight Normal ctermbg=none
-- highlight NonText ctermbg=none
-- hi CursorLine guibg=NONE guifg=NONE
-- hi StatusLine guibg=NONE guifg=NONE
-- hi SignColumn guibg=NONE guifg=NONE
-- hi FoldColumn guibg=NONE guifg=NONE
-- hi ColorColumn guibg=NONE guifg=NONE
-- hi LineNr guibg=NONE guifg=NONE
-- hi CursorLineNr guibg=NONE
-- ]]
--
