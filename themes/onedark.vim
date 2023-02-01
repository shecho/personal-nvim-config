" onedark.vim override: Don't set a background color when running in a terminal;
if (has("autocmd") && !has("gui_running"))
    augroup highlightYankedText
	autocmd!
	autocmd TextYankPost *  silent! lua require'vim.highlight'.on_yank()
    augroup END
endif

hi Comment cterm=italic
" cterm=bold,underline,italic ctermfg=168 gui=bold,underline,italic guifg=#e06c75 guisp=#e06c75
" highlight DiagnosticUnderlineError cterm=bold,underline,italic ctermfg=168 gui=bold,underline,italic guifg=#e06c75 guisp=#e06c75
" highlight link LspSagaFinderSelection guifg='#ff0000' guibg='#00ff00' gui='bold'
" highlight CopilotSuggestion guifg=#555555 ctermfg=8

" let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
let g:onedark_termcolors=256
let g:one_termcolors=256
let g:one_allow_italics = 1 

syntax on
" colorscheme onedark
colorscheme one

call one#highlight('Special', '', '', 'bold')
" call one#highlight('@attribute', '', '', 'bold,standout')
" call one#highlight('@variable', '', '', 'bold,standout')
call one#highlight('Constant', '', '', 'bolditalic')
" call one#highlight('@Constant', '', '', 'bolditalic')
call one#highlight('Boolean', '', '', 'bolditalic')
call one#highlight('Conditional', '', '', 'italic')
call one#highlight('SpecialChar', '', '', 'bold')
call one#highlight('Character', '', '', 'bold')
call one#highlight('Function', '', '','bold')" #B243E6
call one#highlight('Include', 'c678dd', '', 'italic')"imports/exports
call one#highlight('Tag', '', '', 'bold')
call one#highlight('Number', '', '', 'bold')
call one#highlight('Float', '', '', 'bold')
call one#highlight('String', '', '', 'bold')"string
call one#highlight('Repeat', '', '','italic')" #B243E6
call one#highlight('Type', '', '', 'bolditalic') 
call one#highlight('Asynchronous', '', '', 'italic')
call one#highlight('Operator', 'c678dd', '', '')" *= - + =>'#c678dd#
call one#highlight('Exception', '', '', 'italic') " try catch
call one#highlight('StorageClass', '', '','bolditalic')" #B243E6
call one#highlight('Error', 'be5046', '', 'bolditalic')"#e06c75 #be5046 #c18401 #e5c07b #d19a66
call one#highlight('ErrorMsg', 'e06c75', '', 'bold')
call one#highlight('DiagnosticVirtualTextError', 'e06c75', '', 'bolditalic')
call one#highlight('DiagnosticError', 'e06c75', '', 'bolditalic')
call one#highlight('DiagnosticFloatingError', 'e06c75', '', 'bolditalic')
call one#highlight('DiagnosticSignError', 'e06c75', '', 'bolditalic')
call one#highlight('DiagnosticUnderlineError', 'e06c75', '', 'bolditalic,underline')
call one#highlight('Identifier', '', '', 'bold')"params abd arguments and variables names
call one#highlight('Keyword', 'c678dd', '', 'italic')"reserved words
call one#highlight('Delimiter','', '', 'bold')"brackets
call one#highlight('MatchParen', '', '', 'underline,bolditalic')
call one#highlight('MatchBrackets', '', '', 'bolditalic')
" call one#highlight('Directory', '', '', 'bold')
" call one#highlight('Label', '', '', 'bold,underline')"html and jsx 
" call one#highlight('WildMenu', '', '', 'reverse')
" call one#highlight('Use', '', '', 'standout')
" call one#highlight('Utility', '', '', 'standout')
" call one#highlight('Select', '', '', 'standout')
call one#highlight('Visual', '', '', 'bolditalic')
" call one#highlight('TTabLineSelabLineSel', '', '3e4452', 'bolditalic,underline')
" call one#highlight('TabLineSel', '', '3e4452', 'bolditalic')
" call one#highlight('TabLineFill', '', '', '')
" call one#highlight('TabLine', '', '', '')
call one#highlight('Search', '', '', 'bolditalic')
call one#highlight('IncSearch', '', '', 'bolditalic')
call one#highlight('Statement', '', '', 'bold')
" call one#highlight('Statement', '', '', 'bold')
call one#highlight('CursorColumn', '828997', '', 'standout')"current word #4b5263 #5c6370 #828997 #abb2bf  
" call one#highlight('CursorLine', '', '', 'standout')
" call one#highlight('Cursor', '', '', 'standout')
" call one#highlight('CursorLine', '', '', 'standout')" current line
" call one#highlight('CursorIM', '', '', 'standout')" current line
" call one#highlight('CursorLineNr', '', '', 'standout')" current line
" call one#highlight('LineNr', '', '', 'standout')" current line
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


" let g:VM_highlight_matches = 'value'
" let g:VM_highlight_matches = 'hi! Search ctermfg=228 cterm=underline'
" let g:VM_highlight_matches = 'hi! link Search PmenuSel'
" multi cursors
let g:VM_highlight_matches = 'value'
let g:VM_theme = 'purplegray'

hi IlluminatedWordText gui=bolditalic guifg=#828997
hi CursorColumn gui=bolditalic guifg=#828997

" augroup illuminate_augroup
"     autocmd!
"     autocmd VimEnter * hi link illuminatedWord CursorLine
"     autocmd VimEnter * hi link illuminatedWord CursorColumn
" augroup END

" augroup illuminate_augroup
"     autocmd!
"     autocmd VimEnter * hi illuminatedWord cterm=underline,bolditalic gui=underline guifg=#828997
" augroup END
" augroup illuminate_augroup
"     autocmd!
"     autocmd VimEnter * hi illuminatedCurWord cterm=italic gui=italic guifg=#828997
" augroup END

if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
