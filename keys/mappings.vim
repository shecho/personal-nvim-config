imap <C-h> <C-w>h
imap <C-j> <C-w>j
imap <C-k> <C-w>k
imap <C-l> <C-w>l

" g Leader key
let mapleader=" "
" let localleader=" "
nnoremap <Space> <Nop>

" Better indenting
vnoremap < <gv
vnoremap > >gv

" I hate escape more than anything else
" inoremap k <Esc>
inoremap kj <Esc>

nnoremap <leader>; :
nnoremap s <Esc>
xnoremap s <Esc>
vnoremap s <Esc>

" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>
vnoremap <c-u> viwU<Esc>

" TAB in general mode will move to text buffer
nnoremap <silent> <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <silent> <S-TAB> :bprevious<CR>

" Move selected line / block of text in visual mode
" shift + k to move up
" shift + j to move down
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" Alternate way to save
nnoremap <silent> <C-s> :w<CR>

" Alternate way to quit
nnoremap <silent> <C-Q> :wq!<CR>

" Use control-c instead of escape
nnoremap <silent> <C-c> <Esc>

" <TAB>: completion.
 inoremap <silent> <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
 inoremap <silent> <expr><C-j> pumvisible() ? "\<C-n>" : "\<TAB>"
" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Terminal window navigation
" tnoremap <C-h> <C-\><C-N><C-w>h
" tnoremap <C-j> <C-\><C-N><C-w>j
" tnoremap <C-k> <C-\><C-N><C-w>k
" tnoremap <C-l> <C-\><C-N><C-w>l
" inoremap <C-h> <C-\><C-N><C-w>h
" inoremap <C-j> <C-\><C-N><C-w>j
" inoremap <C-k> <C-\><C-N><C-w>k
" inoremap <C-l> <C-\><C-N><C-w>l
" tnoremap <Esc> <C-\><C-n>
" Use alt + hjkl to resize windows
nnoremap <silent> <C-j>    :resize -2<CR>
nnoremap <silent> <C-k>    :resize +2<CR>
nnoremap <silent> <S-h>    :vertical resize -2<CR>
nnoremap <silent> <S-l>    :vertical resize +2<CR>

" Better nav for omnicomplete
" inoremap <expr> <c-j> ("\<C-n>")
" inoremap <expr> <c-k> ("\<C-p>")

"Some better remaps
nnoremap Y y$ " 
nnoremap N Nzzzv
nnoremap J mzJ`z
cnoremap Q q

" Select all and some surround like keybindings
nmap <C-a> gg<S-v>Gy

xnoremap <leader>9 xi()<Esc>P
nnoremap <leader>9 ciw()<Esc>P

xnoremap <leader>4 xi{}<Esc>P
nnoremap <leader>4 ciw{}<Esc>P

xnoremap <leader>5 xi[]<Esc>P
nnoremap <leader>5 ciw[]<Esc>P

xnoremap <leader>7 xi''<Esc>P
nnoremap <leader>7 ciw''<Esc>P

xnoremap <leader>8 xi""<Esc>P
nnoremap <leader>8 ciw""<Esc>P 

nnoremap <leader>1 <c-^>


" TODO: Lo to witch wey " harpoon
" nnoremap <leader>R :lua require("harpoon.mark").rm_file()<CR>
nnoremap <leader>nc :lua require("harpoon.mark").clear_all()<CR>
nnoremap <leader>M :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>m :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>n1 :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>n2 :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>lf :lua vim.lsp.buf.format({async = true})<CR>
nnoremap <leader>lq :lua vim.lsp.buf.code_action()<CR>

