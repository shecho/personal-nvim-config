return {
  {
    "rakr/vim-one",
    priority = 1000, -- make sure to load this before all the other start plugins
    lazy = false,
    config = function()
      vim.cmd([[
        if (has("autocmd") && !has("gui_running"))
            augroup highlightYankedText
            autocmd!
            autocmd TextYankPost *  silent! lua require'vim.highlight'.on_yank()
            augroup END

        endif

        let g:onedark_terminal_italics=1
        let g:onedark_termcolors=256
        let g:one_termcolors=256
        let g:one_allow_italics = 1

        syntax on
        colorscheme one

        " call one#highlight('@Constant', '', '', 'bolditalic')
        call one#highlight('@variable.builtin', '', '', 'bold')
        call one#highlight('@variable.member', 'e06c75', '', 'bold')
        " call one#highlight('@variable.parameter', '', '000000', 'bold')
        " call one#highlight('@variable', '528bff', '', 'bold')"
        " call one#highlight('@attribute', '', '', 'bold,standout')
        call one#highlight('@Tag', 'e5c07b', '', 'bold')
        call one#highlight('@Tag.delimiter', 'abb2bf', '', 'bold') " #B243E6 </>
        call one#highlight('@Tag.attribute', 'd19a66', '', 'bolditalic') " #B243E6
        " call one#highlight('Tag', 'B243E6', '', 'bold')
        call one#highlight('normal', '', '', 'bold')
        call one#highlight('Special', '', '', 'bold')
        call one#highlight('Constant', '', '', 'bold')
        call one#highlight('@constant.builtin', 'c678dd', '', 'bold')
        call one#highlight('@Keyword', 'c678dd', '', 'italic')"reserved words
        call one#highlight('@keyword.function', 'c678dd', '', 'bolditalic')
        call one#highlight('@keyword.operator', '', '', 'italic')
        call one#highlight('@Parameter', '', '', 'bolditalic,')"params abd arguments and variables names
        call one#highlight('@Parameter.reference', '', '', 'bolditalic,')"params abd arguments and variables names
        call one#highlight('@method', '528bff', '', 'italic')
        call one#highlight('@property', 'd19a66', '', 'bolditalic')
        call one#highlight('Boolean', '', '', 'bolditalic')
        call one#highlight('Conditional', '', '', 'italic')
        call one#highlight('SpecialChar', '', '', 'bold')
        call one#highlight('Character', '', '', 'bold')
        call one#highlight('@character', '', '', 'bold')
        call one#highlight('Include', 'c678dd', '', 'italic')"imports/exports
        call one#highlight('@Tag', '', '', 'bold')
        call one#highlight('Number', '', '', 'bold')
        call one#highlight('Float', '', '', 'bold')
        call one#highlight('String', '', '', 'bold')
        call one#highlight('Repeat', '', '','italic')"
        call one#highlight('Type', '', '', 'bold')
        call one#highlight('@type.definition', '', '', 'bolditalic')
        call one#highlight('Asynchronous', '', '', 'italic')
        call one#highlight('Exception', '', '', 'italic') " try catch
        call one#highlight('StorageClass', '', '','bolditalic')" #B243E6  #c678dd #282C34 #abb2bf
        call one#highlight('Error', 'be5046', '', 'bolditalic')" #e06c75 #be5046 #e45649 #ca1243 #c18401 #e5c07b #d19a66 #56B6C2 #61afef #528bff #4078f2
        call one#highlight('ErrorMsg', 'e06c75', '', 'bold')
        call one#highlight('DiagnosticVirtualTextError', 'e06c75', '', 'bolditalic')
        call one#highlight('DiagnosticError', 'e06c75', '', 'bolditalic')
        call one#highlight('DiagnosticFloatingError', 'e06c75', '', 'bolditalic')
        call one#highlight('DiagnosticSignError', 'e06c75', '', 'bolditalic')
        call one#highlight('DiagnosticUnderlineError', 'e06c75', '', 'bolditalic,underline')
        call one#highlight('Delimiter','', '', 'bold')"brackets () {} []
        call one#highlight('MatchParen', '', '', 'underline,bolditalic')
        call one#highlight('@punctuation.bracket', '', '', 'bold')" *= - + =>
        " call one#highlight('@Punctuation.delimiter', '', '', 'bold')
        call one#highlight('@operator', 'c678dd', '', '')" *= - + =>'
        " call one#highlight('Operator', '', '', '')" *= - + =>'
        " call one#highlight('@punctuation.delimiter', 'c678dd', '', 'bold')" *= - + =>'
        call one#highlight('@function', '61afef', '', 'bold')"
        call one#highlight('@function.method', '528bff', '', 'bold')"
        call one#highlight('@function.builtin', '528bff', '', 'bolditalic')"
        call one#highlight('@function.macro', '528bff', '', 'bolditalic')"
        " call one#highlight('@field', '', '', 'bolditalic')"
        " call one#highlight('@symbol', '', '', 'bolditalic')"
        " call one#highlight('@text.uri', '', '', 'bolditalic,underline')"
        " call one#highlight('Function', '61afef', '','bold')"
        " call one#highlight('Identifier', '', '', 'bold')"
        " call one#highlight('Keyword', 'c678dd', '', 'italic')"reserved words
        " call one#highlight('@Punctuation', '', '', 'bold')
        " call one#highlight('@Punctuation.bracket', '', '', 'bold')
        " call one#highlight('@Punctuation', '', '', 'bold')
        call one#highlight('Directory', '', '', 'bold')
        " call one#highlight('Label', '61afef', '', 'bold')"html and jsx
        " call one#highlight('@label', '61afef', '', 'bold')"html and jsx
        " call one#highlight('WildMenu', '', '', 'reverse')
        " call one#highlight('Use', '', '', 'standout')
        " call one#highlight('Utility', '', '', 'standout')
        " call one#highlight('Select', '', '', 'standout')
        call one#highlight('Visual', '', '', 'bolditalic')
        " call one#highlight('TTabLineSelabLineSel', '', '3e4452', 'bolditalic,underline')
        " call one#highlight('TabLineSel', '', '3e4452', 'bolditalic')
        " call one#highlight('TabLineFill', '', '', '')
        call one#highlight('TabLine', '', '', 'bold')
        " call one#highlight('Search', '', '', 'bolditalic')
        " call one#highlight('IncSearch', '', '', 'bolditalic,standout')
        call one#highlight('Statement', '', '', 'bold')
        call one#highlight('CursorColumn', '828997', '', 'standout')" word #4b5263 #5c6370  5c6370 #828997 #abb2bf  abb2bf
        " call one#highlight('CursorLine', '', '', 'standout')
        " call one#highlight('Cursor', '', '', 'standout')
        " call one#highlight('CursorIM', '', '', 'standout')"
        " call one#highlight('CursorLineNr', '', '', 'standout')"
        " call one#highlight('LineNr', '', '', 'standout')"
        " call one#highlight('Define', '', '000000', 'bolditalic')

        " underline
        " undercurl	curly underline
        " strikethrough
        " reverse
        " inverse		same as reverse
        " italic
        " standout
        " --------------------------------------------------------------

        let g:VM_theme = 'purplegray'
        hi illuminatedWord gui=bolditalic guifg=#828997
        hi IlluminatedWordText gui=bolditalic guifg=#828997
        hi IlluminatedWordRead gui=bolditalic guifg=#828997
        if (has("termguicolors"))
            set termguicolors
            hi LineNr ctermbg=NONE guibg=NONE
        endif
      ]])
    end,
  },
}
