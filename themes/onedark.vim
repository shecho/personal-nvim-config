" onedark.vim override: Don't set a background color when running in a terminal;
" if (has("autocmd") && !has("gui_running"))
"   augroup colorset
"     autocmd!
"     let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
"     autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
"   augroup END
" endif

"autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting

hi Comment cterm=italic
" let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
let g:onedark_termcolors=256
let g:one_termcolors=256
let g:one_allow_italics = 1 

syntax on
" colorscheme onedark
colorscheme one
call one#highlight('Boolean', '', '', 'italic')
call one#highlight('Conditional', '', '', 'italic')
call one#highlight('Type', '', '', 'italic') 
call one#highlight('Keyword', 'c678dd', '', 'italic')"reserved words
call one#highlight('Include', 'c678dd', '', 'italic')"imports/exports
" call one#highlight('Function', 'B243E6', '000000', 'italic')
" call one#highlight('Delimiter','', '', 'italic')"brackets
" call one#highlight('Identifier', '', '', 'italic')"params abd arguments
" call one#highlight('Define', '', '', 'italic')
" call one#highlight('SpecialChar', '000000', '000000', 'italic')
" call one#highlight('Special', '000000', '', 'italic')
" call one#highlight('Operator', '', '', 'italic')"not use to evoid the ligatures lost
" call one#highlight('Statement', 'B243E6', '000000', 'italic')
" call one#highlight('PreCondit', 'B243E6', '000000','italic')"not working 
" call one#highlight('Structure', 'B243E6', '000000', 'italic')"not working 
" call one#highlight('Typedef', 'B243E6', '000000', 'italic')"not working 
" call one#highlight('', '', '', 'italic')
" call one#highlight('', '', '', 'italic')
" call one#highlight('', '', '', 'italic')
" 
" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
