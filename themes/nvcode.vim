hi Comment cterm=italic
highlight Comment cterm=italic
let g:nvcode_termcolors=256
let g:nvcode_allow_italics = 1 
" let g:edge_style = 'aura'
" let g:edge_enable_italic = 1
" let g:edge_disable_italic_comment = 1
" onedark
" let g:onedark_hide_endofbuffer=1
" let g:onedark_terminal_italics=1
" let g:onedark_termcolors=256
" let g:one_termcolors=256
" let g:one_allow_italics = 1 
syntax on
" colorscheme nord
colorscheme one
" colorscheme edge
" colorscheme onedark
" colorscheme onehalflight
" colorscheme dracula       
" colorscheme nvcode
" colorscheme TSnazzy
" colorscheme aurora
" one

" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
