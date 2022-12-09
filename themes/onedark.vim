" onedark.vim override: Don't set a background color when running in a terminal;
" if (has("autocmd") && !has("gui_running"))
"   augroup colorset
"     autocmd!
"     let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    " autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
"   augroup END
" endif

hi Comment cterm=italic
" cterm=bold,underline,italic ctermfg=168 gui=bold,underline,italic guifg=#e06c75 guisp=#e06c75
highlight DiagnosticUnderlineError cterm=bold,underline,italic ctermfg=168 gui=bold,underline,italic guifg=#e06c75 guisp=#e06c75
" highlight CopilotSuggestion guifg=#555555 ctermfg=8

" let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
let g:onedark_termcolors=256
let g:one_termcolors=256
let g:one_allow_italics = 1 

syntax on
" colorscheme onedark
colorscheme one
call one#highlight('Boolean', '', '', 'bolditalic')
" call one#highlight('Number', '', '', 'bold')
call one#highlight('Number', '', '', '')
" call one#highlight('Float', '', '', 'bold')
call one#highlight('Float', '', '', '')
call one#highlight('String', '', '', '')"string
" call one#highlight('String', '', '', 'bold')"string
" call one#highlight('Function', '', '','bold')" #B243E6
call one#highlight('Function', '', '','')" #B243E6
call one#highlight('Conditional', '', '', 'italic')
call one#highlight('Repeat', '', '','italic')" #B243E6
call one#highlight('Type', '', '', 'bolditalic') 
call one#highlight('Keyword', 'c678dd', '', 'italic')"reserved words
call one#highlight('Include', 'c678dd', '', 'italic')"imports/exports
call one#highlight('Asynchronous', '', '', 'italic')
call one#highlight('Operator', 'c678dd', '', 'bold')" *= - + =>'#c678dd#
call one#highlight('Exception', '', '', 'italic') " try catch
call one#highlight('StorageClass', '', '','bolditalic')" #B243E6
" call one#highlight('Constant', '', '', 'bold')
call one#highlight('Constant', '', '', '')
" call one#highlight('Label', '', '', 'bold')"HTML tags and JSX
call one#highlight('Label', '', '', '')"HTML tags and JSX
call one#highlight('CursorColumn', '828997', '', 'bolditalic')"current word #4b5263 #5c6370 #828997 #abb2bf
call one#highlight('Error', 'be5046', '', 'bolditalic')"#e06c75 #be5046 #c18401 #e5c07b #d19a66
call one#highlight('ErrorMsg', 'e06c75', '', 'bold')
call one#highlight('DiagnosticVirtualTextError', 'e06c75', '', 'bolditalic')
call one#highlight('DiagnosticError', 'e06c75', '', 'bolditalic')
call one#highlight('DiagnosticFloatingError', 'e06c75', '', 'bolditalic')
call one#highlight('DiagnosticSignError', 'e06c75', '', 'bolditalic')
call one#highlight('DiagnosticUnderlineError', 'e06c75', '', 'bolditalic,underline')
" call one#highlight('Identifier', '', '', 'bold')"params abd arguments and variables names
call one#highlight('Identifier', '', '', '')"params abd arguments and variables names
" call one#highlight('SpecialChar', '', '', 'standout')
" call one#highlight('Special', '', '', 'bolditalic')
call one#highlight('Delimiter','', '', '')"brackets
" call one#highlight('Delimiter','', '', 'bold')"brackets
call one#highlight('MatchParen', '', '', 'underline,bolditalic')
" call one#highlight('MatchBrackets', '', '', 'bolditalic')
" call one#highlight('Label', '', '000000', 'italic')html and jsx 
" call one#highlight('WildMenu', '', '', 'reverse')
" call one#highlight('Directory', '', '', 'bold')
" call one#highlight('CursorLine', '', '', 'standout')
" call one#highlight('Use', '', '', 'standout')
" call one#highlight('Utility', '', '', 'standout')
" call one#highlight('Select', '', '', 'standout')
" call one#highlight('Character', '', '', 'standout')
" call one#highlight('Tag', '', '', 'standout')
call one#highlight('Visual', '', '', 'bolditalic')
" call one#highlight('TTabLineSelabLineSel', '', '3e4452', 'bolditalic,underline')
" call one#highlight('TabLineSel', '', '3e4452', 'bolditalic')
" call one#highlight('TabLineFill', '', '', '')
" call one#highlight('TabLine', '', '', '')
" call one#highlight('Search', '000000', '000000', 'bolditalic')
" call one#highlight('IncSearch', '', '', 'bolditalic')
" call one#highlight('Statement', '', '', '')
" call one#highlight('Statement', '', '', 'bold')
" call one#highlight('CursorLine', '', '', 'bolditalic')" current line
" call one#highlight('CursorIM', '', '', 'bolditalic')" current line
" call one#highlight('CursorLineNr', '', '', 'bolditalic')" current line
" call one#highlight('LineNr', '', '', 'bolditalic')" current line
" call one#highlight('Define', '', '000000', 'bolditalic')
" 
		" bold
		" underline
		" undercurl	curly underline
		" strikethrough
		" reverse
		" inverse		same as reverse
		" italic
		" standout
		" nocombine	override attributes instead of combining them
		" NONE		no attributes used (used to reset it)
" checks if your terminal has 24-bit color support
" --------------------------------------------------------------
" colorscheme onedark
" autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": 'c678dd',  "gui": "italic", "cterm": "italic" }) " `bg` will not be styled since there is no `bg` setting
" autocmd ColorScheme * call onedark#set_highlight("Type", { "fg": 'c678dd',  "gui": "italic", "cterm": "italic" }) " `bg` will not be styled since there is no `bg` setting

if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
