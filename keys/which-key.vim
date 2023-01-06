" ; ; ; Leader Key Maps

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
let g:which_key_flatten = 0
let g:which_key_floating_opts = { 'row': '-1', 'col':'-1', 'width': '4' ,'height':'4' }
let g:which_key_max_size = 4
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
let g:which_key_map['e'] = [ ':CocCommand explorer'               , 'explorer' ]
let g:which_key_map['E'] = [ ':NvimTreeToggle'               , 'explorer' ]
let g:which_key_map['f'] = [ ':Telescope projects theme=dropdown winblend=40 layout_config={prompt_position="top"}', 'Find project' ]
let g:which_key_map['h'] = [ '<C-W>s'                             , 'split below']
let g:which_key_map['m'] = [ ':call WindowSwap#EasyWindowSwap()'  , 'move window' ]
let g:which_key_map['p'] = [ ':Telescope find_files previewer=false theme=dropdown winblend=10 layout_config={height=0.80,width=0.70}', 'Find files' ]
let g:which_key_map['q'] = [ 'q'                                  , 'quit' ]
let g:which_key_map['r'] = [ ':Telescope buffers'                 , 'search ag' ]
let g:which_key_map['u'] = [ ':UndotreeToggle'                    , 'undo tree']
let g:which_key_map['v'] = [ '<C-W>v'                             , 'split right']
let g:which_key_map['W'] = [ 'w'                                  , 'write' ]
let g:which_key_map['Z'] = [ ':ZenMode'                           , 'zen' ]


" Group mappings

" a is for actions
let g:which_key_map.a = {
      \ 'name' : '+actions' ,
      \ 'c' : [':ColorizerToggle'                                                                       , 'colorizer'],
      \ 'e' : [':CocCommand explorer'                                                                   , 'explorer'],
      \ 'a' : [':NvimTreeToggle'                                                                   , 'explorer'],
      \ 'l' : [''                 , ''],
      \ 'L' : [''             , ''],
      \ 'm' : [':MarkdownPreview'                                                                       , 'markdown preview'],
      \ 'M' : [':MarkdownPreviewStop'                                                                   , 'markdown preview stop'],
      \ 'n' : [':set nonumber!'                                                                         , 'line-numbers'],
      \ 'r' : [':set norelativenumber!'                                                                 , 'relative line nums'],
      \ 's' : [':let @/ = ""'                                                                           , 'remove search highlight'],
      \ 't' : [':FloatermToggle'                                                                        , 'terminal'],
      \ 'v' : [':hi DiagnosticUnderlineError gui=bold,underline,italic guisp=#e06c75'                   , 'Change Error Color'],
      \ 'V' : [':'                                                                                      , 'virtual repl off'],
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
      \ 'a' : ['<cmd>lua require("harpoon.mark").add_file()<CR>'                                                              , 'Mark file'],
      \ 'C' : ['<cmd>:lua require"harpoon.ui".toggle_quick_menu()<CR>'                                                        , 'Mark menu'],
      \ 'c' : [':Telescope harpoon marks theme=dropdown previewer=false winblend=15 layout_config={height=0.60,width=0.50}'   , 'Mark menu'],
      \ 'l' : [':so %'                                                                                                        , 'Soruce Vimrc'],
      \ 'o' : [':IndentBlanklineToggle'                                                                                       , 'TogglBlankLine'],
      \ }
" <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
" f is for find and replace
let g:which_key_map.F = {
      \ 'name' : '+find & replace' ,
      \ 'r' : [':RnvimrToggle'    , 'buffer'],
      \ 'f' : [':Telescope find_files prompt_prefix=🔍 hidden=true winblend=20 layout_config={height=0.95,width=.90,prompt_position="top"}', 'find files' ],
      \ }

" k is for task
let g:which_key_map.K = {
      \ 'name' : '+task' ,
      \ 'c' : [':AsyncTask file-compile'      , 'compile file'],
      \ 'b' : [':AsyncTask project-build'     , 'build project'],
      \ 'e' : [':AsyncTaskEdit'               , 'edit local tasks'],
      \ 'f' : [':AsyncTaskFzf'                , 'find task'],
      \ 'g' : [':AsyncTaskEdit!'              , 'edit global tasks'],
      \ 'h' : [':AsyncTaskList!'              , 'list hidden tasks'],
      \ 'l' : [':CocList tasks'               , 'list tasks'],
      \ 'm' : [':AsyncTaskMacro'              , 'macro help'],
      \ 'o' : [':copen'                       , 'open task view'],
      \ 'r' : [':AsyncTask file-run'          , 'run file'],
      \ 'p' : [':AsyncTask project-run'       , 'run project'],
      \ 'x' : [':cclose'                      , 'close task view'],
      \ }

" s is for search
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'              , 'history'],
      \ ';' : [':Commands'              , 'commands'],
      \ 'a' : [':Rg'                    , 'text Ag'],
      \ 'B' : [':BLines'                , 'current buffer'],
      \ 'b' : [':Telescope buffers'     , 'open buffers'],
      \ 'c' : [':Commits'               , 'commits'],
      \ 'C' : [':BCommits'              , 'buffer commits'],
      \ 'f' : [':Rg'                    , 'files'],
      \ 'r' : [':RnvimrToggle'          , 'ranger'],
      \ 'g' : [':Telescope git_branches', 'git branches'],
      \ 'G' : [':GFiles:'               , 'modified git files'],
      \ 'h' : [':History'               , 'file history'],
      \ 'H' : [':History:'              , 'command history'],
      \ 'l' : [':Lines'                 , 'lines'] ,
      \ 'm' : [':Marks'                 , 'marks'] ,
      \ 'M' : [':Maps'                  , 'normal maps'] ,
      \ 'p' : [':Telescope oldfiles'    , 'help tags'] ,
      \ 'P' : [':Telescope oldfiles'    , 'project tags'],
      \ 's' : [':Telescope find_files prompt_prefix=🔍 hidden=true winblend=20 layout_config={height=0.95,width=.90,prompt_position="top"}'      , 'snippets'],
      \ 'S' : [':CocList snippets'                , 'color schemes'],
      \ 't' : [':Files'                 , 'text Rg'],
      \ 'T' : [':BTags'                 , 'buffer tags'],
      \ 'w' : [':Windows'               , 'search windows'],
      \ 'y' : [':Filetypes'             , 'file types'],
      \ 'z' : [':FZF'                   , 'FZF'],
      \ '=' : [':resize +4<CR>'         , '+4'],
      \ '-' : [':resize -4<CR>'         , '-4'],
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
      \ 'A' : [':GitBlameDisable'                  , 'blame disable'],
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
      \ 'm' : ['<Plug>(git-messenger)'             , 'message'],
      \ 'p' : [':Git push'                         , 'push'],
      \ 'P' : [':Git pull'                         , 'pull'],
      \ 'r' : [':GRemove'                          , 'remove'],
      \ 'S' : ['<Plug>(GitGutterStageHunk)'        , 'stage hunk'],
      \ 's' : [':!git status'                      , 'status'],
      \ 't' : [':GitGutterSignsToggle'             , 'toggle signs'],
      \ 'u' : ['<Plug>(GitGutterUndoHunk)'         , 'undo hunk'],
      \ 'v' : [':GV'                               , 'view commits'],
      \ 'V' : [':GV!'                              , 'view buffer commits'],
      \ }

let g:which_key_map.G = {
      \ 'name' : '+gist' ,
      \ 'a' : [':Gist -a'                          , 'post gist anon'],
      \ 'b' : [':Gist -b'                          , 'post gist browser'],
      \ 'd' : [':Gist -d'                          , 'delete gist'],
      \ 'e' : [':Gist -e'                          , 'edit gist'],
      \ 'l' : [':Gist -l'                          , 'list public gists'],
      \ 's' : [':Gist -ls'                         , 'list starred gists'],
      \ 'm' : [':Gist -m'                          , 'post gist all buffers'],
      \ 'p' : [':Gist -P'                          , 'post public gist '],
      \ 'P' : [':Gist -p'                          , 'post private gist '],
      \ }

" l is for coc lsp
let g:which_key_map.l = {
      \ 'name' : '+lsp' ,
      \ '.' : [':CocConfig'                          , 'config'],
      \ 'c' : ['<Plug>(coc-refactor)'                , 'refactor'],
      \ 'a' : ['<Plug>(coc-codeaction)'              , 'line action'],
      \ 'A' : [':Telescope coc code_actions theme=dropdown'     , 'selected action'],
      \ 'b' : [':CocNext'                            , 'next action'],
      \ 'B' : [':CocPrev'                            , 'prev action'],
      \ 'C' : [':CocList commands'                   , 'commands'],
      \ 'd' : ['<Plug>(coc-definition)'              , 'definition'],
      \ 'D' : [':Telescope lsp_definitions'             , 'declaration'],
      \ 'e' : [':CocList extensions'                 , 'extensions'],
      \ 'F' : [':lua vim.lsp.buf.format({async = true})'         , 'format selected'],
      \ 'f' : ['<Plug>(coc-format)'                  , 'format'],
      \ 'h' : ['<Plug>(coc-float-hide)'              , 'hide'],
      \ 'i' : ['<Plug>(coc-implementation)'          , 'implementation'],
      \ 'I' : [':CocList diagnostics'                , 'diagnostics'],
      \ 'j' : ['<Plug>(coc-float-jump)'              , 'float jump'],
      \ 'l' : ['<Plug>(coc-codelens-action)'         , 'code lens'],
      \ 'n' : ['<Plug>(coc-diagnostic-next)'         , 'next diagnostic'],
      \ 'N' : ['<Plug>(coc-diagnostic-next-error)'   , 'next error'],
      \ 'o' : ['<Plug>(coc-openlink)'                , 'open link'],
      \ 'O' : [':CocList outline'                    , 'outline'],
      \ 'p' : ['<Plug>(coc-diagnostic-prev)'         , 'prev diagnostic'],
      \ 'P' : ['<Plug>(coc-diagnostic-prev-error)'   , 'prev error'],
      \ 'q' : ['<Plug>(coc-fix-current)'             , 'quickfix'],
      \ 'R' : ['<Plug>(coc-rename)'                  , 'rename'],
      \ 'r' : [':Telescope coc references layout_config={height=0.95,width=.90}'                                      , 'references'],
      \ 's' : [':Telescope coc lsp_references theme=dropdown layout_config={height=0.75,width=.70,prompt_position="top"}'     , 'Document Symbols'],
      \ 'S' : [':CocList snippets'                   , 'snippets'],
      \ 't' : ['<Plug>(coc-type-definition)'         , 'type definition'],
      \ 'u' : [':CocListResume'                      , 'resume list'],
      \ 'U' : [':CocUpdate'                          , 'update CoC'],
      \ 'v' : [':Vista!!'                            , 'tag viewer'],
      \ 'Z' : [':CocDisable'                         , 'disable CoC'],
      \ 'z' : [':CocEnable'                          , 'enable CoC'],
      \ }

" t is for terminal
let g:which_key_map.t = {
      \ 'name' : '+terminal' ,
      \ ';' : [':FloatermNew --wintype=popup --height=6'        , 'terminal'],
      \ 'f' : [':FloatermNew fzf'                               , 'fzf'],
      \ 'g' : [':FloatermNew lazygit'                           , 'git'],
      \ 'd' : [':FloatermNew lazydocker'                        , 'docker'],
      \ 'n' : [':FloatermNew node'                              , 'node'],
      \ 'N' : [':FloatermNew ranger'                               , 'nnn'],
      \ 'p' : [':FloatermNew python'                            , 'python'],
      \ 'm' : [':FloatermNew lazynpm'                           , 'npm'],
      \ 'r' : [':FloatermNew ranger'                            , 'ranger'],
      \ 't' : [':FloatermToggle'                                , 'toggle'],
      \ 'y' : [':FloatermNew ytop'                              , 'ytop'],
      \ 's' : [':FloatermNew ncdu'                              , 'ncdu'],
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

" w  TODO: Add more keys to W
let g:which_key_map.W = {
      \ 'name' : '+' ,
      \ 'w' : ['<Plug>'                              , 'ncdu'],
      \ 'n' : ['<plug>()'                              , 'ncdu'],
      \ 'j' : ['<plug>()'                              , 'ncdu'],
      \ 'R' : ['<plug>()'                              , 'ncdu'],
      \ 'c' : ['<plug>()'                              , 'ncdu'],
      \ 'b' : ['<plug>()'                              , 'ncdu'],
      \ }


" Register which key map
call which_key#register('<Space>', "g:which_key_map")
