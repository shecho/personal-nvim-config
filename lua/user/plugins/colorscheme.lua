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
        " call one#highlight('@none', '', '', 'bold')
        " call one#highlight('@text', '', '000000', 'bold')
        " call one#highlight('@variable.parameter', 'e5c07b', '000000', 'bold')
        " call one#highlight('@variable.member', '', '000000', 'bold')

        call one#highlight('@variable', 'abb2bf', '', '')
        call one#highlight('normalfloat', '', '282C34', 'bold')
        call one#highlight('String', '', '', 'bold')
        call one#highlight('Repeat', '', '','italic')"
        call one#highlight('Type', '', '', 'bold')
        call one#highlight('@Keyword', 'c678dd', '', 'italic')"reserved words
        call one#highlight('@Constant', '', '', 'bolditalic')
        call one#highlight('@variable.builtin', '', '', 'bold')
        call one#highlight('@variable.member', 'e06c75', '', 'bold')
        call one#highlight('@variable.parameter', 'e06c75', '', 'bold')
        call one#highlight('@variable', '', '', 'bold')"
        call one#highlight('normal', '', '', 'bold')
        call one#highlight('Delimiter','abb2bf', '', 'bold')"brackets () {} []
        call one#highlight('MatchParen', '', '', 'underline,bolditalic')
        " call one#highlight('@attribute', '', '', 'bold')
        " call one#highlight('Tag', 'B243E6', '000000', 'bold')
        call one#highlight('@Tag', 'e5c07b', '', 'bold')
        call one#highlight('@Tag.delimiter', 'abb2bf', '', 'bold') " #B243E6 </>
        call one#highlight('@Tag.attribute', 'd19a66', '', 'bolditalic') " #B243E6
        " call one#highlight('Special', '', '', 'bold')
        call one#highlight('Constant', '', '', 'bold')
        call one#highlight('@constant.builtin', 'c678dd', '', 'bold')
        call one#highlight('@keyword.function', '528bff', '', 'bolditalic')
        " call one#highlight('@keyword.operator', '', '000000', 'italic')
        " call one#highlight('@Parameter', '', '000000', 'bolditalic,')"params abd arguments and variables names
        " call one#highlight('@Parameter.reference', '', '528bff', 'bolditalic,')"params abd arguments and variables names
        call one#highlight('@method', '528bff', '', 'italic')
        call one#highlight('@property', 'e06c75', '', 'bolditalic') " #
        call one#highlight('Boolean', '', '', 'bolditalic')
        call one#highlight('Conditional', 'B243E6', '', 'italic')
        " call one#highlight('SpecialChar', '', '', 'bold,standout')
        " call one#highlight('Character', '', '', 'bold')
        " call one#highlight('@character', '', '', 'bold')
        " call one#highlight('Include', 'c678dd', '000000', 'italic')
        " call one#highlight('Number', '', '', 'bold')
        " call one#highlight('Float', '', '', 'bold')
        call one#highlight('@type.definition', '', '', 'bolditalic')
        call one#highlight('Asynchronous', '', '', 'italic')
        call one#highlight('Exception', '', '', 'italic') " try catch
        call one#highlight('StorageClass', '', '','bolditalic')" #B243E6 #8a3fa0  #7e3992  #c678dd #282C34 #abb2bf #528bff #181a1f #282c34 #31353f #393f4a  #3b3f4c  #0e1013  #151820 
        call one#highlight('Error', 'be5046', '', 'bolditalic')" #e06c75 #be5046 #e45649 #ca1243 #c18401 #e5c07b #d19a66 #56B6C2 #61afef #528bff #4078f2
        call one#highlight('ErrorMsg', 'e06c75', '', 'bold')
        call one#highlight('DiagnosticVirtualTextError', 'e06c75', '', 'bolditalic')
        call one#highlight('DiagnosticError', 'e06c75', '', 'bolditalic')
        call one#highlight('DiagnosticFloatingError', 'e06c75', '', 'bolditalic')
        call one#highlight('DiagnosticSignError', 'e06c75', '', 'bolditalic')
        call one#highlight('DiagnosticUnderlineError', 'e06c75', '', 'bolditalic,underline')
        call one#highlight('@operator', 'c678dd', '', '')" *= - + =>'
        " call one#highlight('@punctuation.bracket', '', '', 'bold')" *= - + =>
        " call one#highlight('@Punctuation.delimiter', '', '', 'bold')
        " call one#highlight('Operator', '', '000000', '')" *= - + =>'
        " call one#highlight('@punctuation.delimiter', 'c678dd', '', 'bold')" *= - + =>'
        " call one#highlight('@function', '61afef', '', 'bold')"
        " call one#highlight('@function.method', '528bff', '', 'bold')"
        " call one#highlight('@function.builtin', '528bff', '', 'bolditalic')"
        " call one#highlight('@function.macro', '528bff', '', 'bolditalic')"
        call one#highlight('@text.uri', '', '', 'bolditalic,underline')"
        " call one#highlight('Identifier', '', '', 'bold')"
        " call one#highlight('Keyword', 'c678dd', '', 'italic')"reserved words
        " call one#highlight('@Punctuation.bracket', '', '', 'bold')
        call one#highlight('Directory', '', '', 'bold')
        " call one#highlight('@label', '61afef', '', 'bold')"html and jsx
        " call one#highlight('WildMenu', '', '', 'reverse')
        " call one#highlight('Use', '', '', 'standout')
        " call one#highlight('Utility', '', '', 'standout')
        " call one#highlight('Select', '', '', 'standout')
        call one#highlight('Visual', '', '', 'bolditalic')
        call one#highlight('TabLine', '', '', 'bold')
        " call one#highlight('Search', '', '', 'bolditalic')
        " call one#highlight('IncSearch', '', '', 'bolditalic,standout')
        " call one#highlight('Statement', '', '', 'bold')
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
        call one#highlight('normal', 'abb2bf', '282C34', 'bold')
        call one#highlight('@variable.builtin', 'd19a66', '', 'italic')

        " call one#highlight('normal', 'abb2bf', '282C34', 'bold')

        let g:VM_theme = 'purplegray'
        hi illuminatedWord gui=bolditalic guifg=#828997
        hi IlluminatedWordText gui=bolditalic guifg=#828997
        hi IlluminatedWordRead gui=bolditalic guifg=#828997
        if (has("termguicolors"))
            set termguicolors
            " hi LineNr ctermbg=NONE guibg=NONE
        endif
      ]])
    end,
  },
}
