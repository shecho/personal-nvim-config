" Leader Key Maps

" Map leader to which_key
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100

" Coc Search & refactor
nnoremap <leader>? :CocSearch <C-R>=expand("<cword>")<CR><CR>
let g:which_key_map['?'] = 'search word'

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 1
let g:which_key_flatten = 1
let g:which_key_floating_opts = { 'row': '-1', 'col':'-1', 'width': '1' ,'height':'1' }
let g:which_key_max_size = 0
" let g:which_key_floating_relative_win= 1

" let g:which_key_fallback_to_native_key=1
" let g:which_key_use_floating_win = 1

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler


" Single mappings
let g:which_key_map['3'] = [ 'gcc'                                , 'comment' ]
let g:which_key_map['/'] = [ ':call Comment()'                    , 'comment' ]
let g:which_key_map['0'] = [ ':e $MYVIMRC'                        , 'open init' ]
let g:which_key_map['-'] = [ ':Commands'                          , 'commands' ]
let g:which_key_map['='] = [ '<C-W>='                             , 'balance windows' ]
let g:which_key_map['d'] = [ ':Bdelete'                           , 'delete buffer']
let g:which_key_map['e'] = [ ':NvimTreeToggle'                    , 'explorer' ]
let g:which_key_map['E'] = [ ':NvimTreeToggle'                    , 'explorer' ]
let g:which_key_map['f'] = [ '', 'Find project' ]
let g:which_key_map['m'] = [ ':call WindowSwap#EasyWindowSwap()'  , 'move window' ]
let g:which_key_map['p'] = [ ':Telescope find_files hidden=true winblend=10 layout_config={height=0.95,width=.90}', 'Find files' ]
let g:which_key_map['q'] = [ 'q'                                  , 'quit' ]
let g:which_key_map['r'] = [ ':Telescope buffers'                 , 'search ag' ]
let g:which_key_map['u'] = [ ':UndotreeToggle'                    , 'undo tree']
let g:which_key_map['v'] = [ '<C-W>v'                             , 'split right']
let g:which_key_map['W'] = [ 'w'                                  , 'write' ]
let g:which_key_map['k'] = [ ':Lspsaga hover_doc'                 , 'Hover' ]
let g:which_key_map['Z'] = [ ':TZMinimalist'                           , 'zen' ]


" Group mappings

" a is for actions
let g:which_key_map.a = {
      \ 'name' : '+actions' ,
      \ '1' : ["'1"                                                                       , 'mark1'],
      \ '2' : ["'2"                                                                       , 'mark2'],
      \ '3' : ["'3"                                                                       , 'mark3'],
      \ '4' : ["'4"                                                                       , 'mark4'],
      \ '5' : ["'5"                                                                       , 'mark5'],
      \ '6' : ["'6"                                                                       , 'mark6'],
      \ '7' : ["'7"                                                                       , 'mark7'],
      \ '8' : ["'8"                                                                       , 'mark8'],
      \ '9' : ["'9"                                                                       , 'mark9'],
      \ 'e' : [':ColorizerToggle'                                                         , 'colorizer'],
      \ 'c' : ['viwU<Esc>'                                                                , 'Capitalize word'],
      \ 'h' : ['<C-W>s'                                                                   , 'explorer'],
      \ 'm' : [''                                                                       , 'markdown preview'],
      \ 'i' : [':hi IlluminatedWordText cterm=bolditalic gui=standout guifg=#828997'      , 'illuminate'],
      \ 'n' : [':set nonumber!'                                                           , 'line-numbers'],
      \ 's' : [':let @/ = ""'                                                             , 'remove search highlight'],
      \ 't' : [':FloatermToggle'                                                          , 'terminal'],
      \ 'w' : [':StripWhitespace'        , 'strip whitespace'],
      \ }

" b is for buffer
let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ '1' : ['b1'        , 'buffer 1'],
      \ '2' : ['b2'        , 'buffer 2'],
      \ 'd' : [':Bdelete'  , 'delete-buffer'],
      \ 'f' : ['bfirst'    , 'first-buffer'],
      \ 'h' : ['Startify'  , 'home-buffer'],
      \ 'l' : ['blast'     , 'last-buffer'],
      \ 'n' : ['bnext'     , 'next-buffer'],
      \ 'p' : ['bprevious' , 'previous-buffer'],
      \ 'b' : ['Buffers'   , 'fzf-buffer'],
      \ }

" c is for copilot
let g:which_key_map.c = {
      \ 'name' : '+copilot' ,
      \ 'd' : ['<Plug>(copilot-dismiss)'                                                                                      , 'copilot-dismiss'],
      \ 'n' : ['<Plug>(copilot-next)'                                                                                         , 'copilot-next'],
      \ 'p' : ['<Plug>(copilot-previous)'                                                                                     , 'copilot-previous'],
      \ 's' : [':Copilot panel'                                                                                               , 'panel'],
      \ 'm' : [':Telescope harpoon marks theme=dropdown previewer=false winblend=15 layout_config={height=0.60,width=0.50}'   , 'Mark menu'],
      \ 'l' : [':so %'                                                                                                        , 'Source Vimrc'],
      \ 'o' : [':IndentBlanklineToggle'                                                                                       , 'TogglBlankLine'],
      \ }
" f is for find and replace
let g:which_key_map.F = {
      \ 'name' : '+find & replace' ,
      \ 'r' : [':RnvimrToggle'    , 'buffer'],
      \ 'f' : [':Telescope find_files prompt_prefix=🔍 hidden=true winblend=20 layout_config={height=0.95,width=.90,prompt_position="top"}', 'find files' ],
      \ }

" k is for task
let g:which_key_map.K = {
      \ 'name' : '+task' ,
      \ }

" s is for search
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ ';' : [':Commands'              , 'commands'],
      \ 'a' : [':Rg'                    , 'text RG'],
      \ 'q' : [':Telescope grep_string hidden=true winblend=20 layout_config={height=0.95,width=.90,prompt_position="top"}'                    , 'live_greep'],
      \ 'B' : [':BLines'                , 'current buffer'],
      \ 'b' : [':Telescope buffers'     , 'open buffers'],
      \ 'c' : [':Commits'               , 'commits'],
      \ 'C' : [':BCommits'              , 'buffer commits'],
      \ 'f' : [':Telescope live_grep'   , 'files'],
      \ 'g' : [':Telescope git_branches', 'git branches'],
      \ 'G' : [':GFiles:'               , 'modified git files'],
      \ 'h' : [':History'               , 'file history'],
      \ 'l' : [':Lines'                 , 'lines'] ,
      \ 'm' : [':Telescope marks layout_strategy=vertical'       , 'marks'] ,
      \ 'M' : [':Maps'                  , 'normal maps'] ,
      \ 'o' : [':Telescope oldfiles layout_strategy=vertical'    , 'recent files'] ,
      \ 'p' : [':Telescope projects theme=dropdown no_ignore=true  winblend=40 layout_config={prompt_position="top"}'    , 'Projects'] ,
      \ 's' : [':Telescope find_files hidden=true no_ignore=true winblend=20 layout_config={height=0.95,width=.90,prompt_position="top"}'      , 'snippets'],
      \ 't' : [':Files'                 , 'Files'],
      \ 'T' : [':BTags'                 , 'buffer tags'],
      \ 'w' : [':Windows'               , 'search windows'],
      \ 'y' : [':Filetypes'             , 'file types'],
      \ }

" S is for Sessions
let g:which_key_map.S = {
      \ 'name' : '+Session' ,
      \ 'c' : [':SClose'          , 'Close Session']  ,
      \ 'd' : [':SDelete'         , 'Delete Session'] ,
      \ 'l' : [':SLoad'           , 'Load Session']     ,
      \ 's' : [':Startify'        , 'Start Page']     ,
      \ 'S' : [':SSave'           , 'Save Session']   ,
      \ }

" g is for git
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'a' : [':Git add .'                        , 'add all'],
      \ 'b' : [':GitBlameToggle'                   , 'blame enable'],
      \ 'B' : [':GBrowse'                          , 'browse'],
      \ 'c' : [':Git commit'                       , 'commit'],
      \ 'd' : [':Git diff'                         , 'diff'],
      \ 'D' : [':Gdiffsplit'                       , 'diff split'],
      \ 'g' : [':GGrep'                            , 'git grep'],
      \ 'G' : [':Gstatus'                          , 'status'],
      \ 'h' : [':GitGutterLineHighlightsToggle'    , 'highlight hunks'],
      \ 'H' : ['<Plug>(GitGutterPreviewHunk)'      , 'preview hunk'],
      \ 'i' : [':Gist -b'                          , 'post gist'],
      \ 'j' : ['<Plug>(GitGutterNextHunk)'         , 'next hunk'],
      \ 'k' : ['<Plug>(GitGutterPrevHunk)'         , 'prev hunk'],
      \ 'l' : [':Git log'                          , 'log'],
      \ 'p' : [':Git push'                         , 'push'],
      \ 'P' : [':Git pull'                         , 'pull'],
      \ 's' : [':git status'                      , 'status'],
      \ 't' : [':GitGutterSignsToggle'             , 'toggle signs'],
      \ 'u' : ['<Plug>(GitGutterUndoHunk)'         , 'undo hunk'],
      \ 'v' : [':GV'                               , 'view commits'],
      \ 'V' : [':GV!'                              , 'view buffer commits'],
      \ }
      " \ 'r' : [':GRemove'                          , 'remove'],

let g:which_key_map.G = {
      \ 'name' : '+gist' ,
      \ 'a' : [''                          , 'post gist anon'],
      \ 'P' : [''                          , 'post private gist '],
      \ }

" l is for lsp
let g:which_key_map.l = {
      \ 'name' : '+lsp' ,
      \ 'c' : [':Lspsaga show_buf_diagnostics'                , 'Diagnostics'],
      \ 'a' : [':Lspsaga code_action'              , 'code action'],
      \ 'D' : [':Telescope lsp_definitions'              , 'definition'],
      \ 'd' : [':Lspsaga goto_definition'             , 'Go to definition'],
      \ 'i' : [':lua vim.lsp.buf.implementations'          , 'Implementation'],
      \ 'j' : [':Lspsaga diagnostics_jump_next'              , 'Next diagnostic'],
      \ 'l' : [':Lspsaga goto_definition'         , 'Go to definition'],
      \ 'p' : [':Lspsaga peek_definition'   , 'Prev error'],
      \ 'r' : [':Telescope lsp_references layout_config={height=0.95,width=.95,prompt_position="top"}'                  , 'References'],
      \ 'R' : [':Lspsaga rename'                                      , 'Rename'],
      \ 's' : [':Lspsaga lsp_finder'                                      , 'Rename'],
      \ 'k' : [':Lspsaga hover_doc'     , 'Hover'],
      \ }

" t is for terminal
let g:which_key_map.t = {
      \ 'name' : '+terminal' ,
      \ ';' : [':FloatermNew --wintype=popup --height=6'        , 'terminal'],
      \ 'f' : [':FloatermNew fzf'                               , 'fzf'],
      \ 'g' : [':FloatermNew lazygit'                           , 'git'],
      \ 'n' : [':FloatermNew node'                              , 'node'],
      \ 'r' : [':FloatermNew ranger'                            , 'ranger'],
      \ 't' : [':FloatermToggle'                                , 'toggle'],
      \ 'y' : [':FloatermNew htop'                              , 'htop'],
      \ }

" T is for terminal
let g:which_key_map.T = {
      \ 'name' : '+tabline' ,
      \ 'b' : [':XTabListBuffers'         , 'list buffers'],
      \ 'd' : [':XTabCloseBuffer'         , 'close buffer'],
      \ 'D' : [':XTabDeleteTab'           , 'close tab'],
      \ 'h' : [':XTabHideBuffer'          , 'hide buffer'],
      \ 'i' : [':XTabInfo'                , 'info'],
      \ 'l' : [':XTabLock'                , 'lock tab'],
      \ 'm' : [':XTabMode'                , 'toggle mode'],
      \ 'n' : [':tabNext'                 , 'next tab'],
      \ 'N' : [':XTabMoveBufferNext'      , 'buffer->'],
      \ 't' : [':tabnew'                  , 'new tab'],
      \ 'p' : [':tabprevious'             , 'prev tab'],
      \ 'P' : [':XTabMoveBufferPrev'      , '<-buffer'],
      \ 'x' : [':XTabPinBuffer'           , 'pin buffer'],
      \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
