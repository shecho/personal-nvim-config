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
" let g:which_key_map['3'] = [ 'gcc'                                , 'comment' ]
" let g:which_key_map['-'] = [ ':Commands'                          , 'commands' ]
let g:which_key_map['p'] = [ ':Telescope find_files hidden=true winblend=10 layout_config={height=0.95,width=.90}', 'Find files' ]


" Group mappings

" a is for actions
let g:which_key_map.a = {
      \ 'name' : '+actions' ,
      \ '1' : ["'1"                                                                       , 'mark1'],
      \ '9' : ["'9"                                                                       , 'mark9'],
      \ 'c' : ['viwU<Esc>'                                                                , 'Capitalize word'],
      \ 's' : [':let @/ = ""'                                                             , 'remove search highlight'],
      \ }

" c is for copilot
let g:which_key_map.c = {
      \ 'name' : '+copilot' ,
      \ 'm' : [':Telescope harpoon marks theme=dropdown previewer=false winblend=15 layout_config={height=0.60,width=0.50}'   , 'Mark menu'],
      \ }


" s is for search
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ 'q' : [':Telescope grep_string hidden=true winblend=20 layout_config={height=0.95,width=.90,prompt_position="top"}'                    , 'live_greep'],
      \ 'f' : [':Telescope live_grep'   , 'files'],
      \ 'g' : [':Telescope git_branches', 'git branches'],
      \ 'm' : [':Telescope marks layout_strategy=vertical'       , 'marks'] ,
      \ 'o' : [':Telescope oldfiles layout_strategy=vertical'    , 'recent files'] ,
      \ 'p' : [':Telescope projects theme=dropdown no_ignore=true  winblend=40 layout_config={prompt_position="top"}'    , 'Projects'] ,
      \ 's' : [':Telescope find_files hidden=true no_ignore=true winblend=20 layout_config={height=0.95,width=.90,prompt_position="top"}'      , 'snippets'],
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
      \ 'i' : [':Gist -b'                          , 'post gist'],
      \ 'l' : [':Git log'                          , 'log'],
      \ 'p' : [':Git push'                         , 'push'],
      \ 'P' : [':Git pull'                         , 'pull'],
      \ 's' : [':git status'                      , 'status'],
      \ 't' : [':GitGutterSignsToggle'             , 'toggle signs'],
      \ 'v' : [':GV'                               , 'view commits'],
      \ 'V' : [':GV!'                              , 'view buffer commits'],
      \ }
      " \ 'r' : [':GRemove'                          , 'remove'],


" t is for terminal
let g:which_key_map.t = {
      \ 'name' : '+terminal' ,
      \ ';' : [':FloatermNew --wintype=popup --height=6'        , 'terminal'],
      \ 'g' : [':FloatermNew lazygit'                           , 'git'],
      \ 'r' : [':FloatermNew ranger'                            , 'ranger'],
      \ 't' : [':FloatermToggle'                                , 'toggle'],
      \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
