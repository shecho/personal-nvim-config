"Vim Commentary General Settings
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/functions.vim
source $HOME/.config/nvim/themes/onedark.vim
source $HOME/.config/nvim/themes/airline.vim


lua << EOF
require "user.keymaps"
require "user.impatient"
require "user.true-zen"
require "user.plug-colorizer"
require "user.treesitter"
require "user.indentline"
require "user.autopairs"

-- Finders
require "user.nvim-tree"
require "user.telescope"
require "user.harpoon"
require "user.project"

-- Lsp
require "user.lsp.mason"
require "user.lsp.null-ls"
require "user.lsp.lspconfig"
require "user.lsp.lspsaga"
require "user.lsp.lspkind"
require "user.cmp"
require "user.copilot"

EOF

source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/keys/which-key.vim

if exists('g:vscode')
 " VS Code extension
  " source $HOME/.config/nvim/vscode/settings.vim
  " source $HOME/.config/nvim/plug-config/easymotion.vim
  " source $HOME/.config/nvim/plug-config/highlightyank.vim
else

  " Themes
  " source $HOME/.config/nvim/themes/syntax.vim
  " source $HOME/.config/nvim/themes/nvcode.vim
  " luafile $HOME/.config/nvim/themes/oneDark.lua

  " Plugin Configuration
  " source $HOME/.config/nvim/plug-config/rnvimr.vim
  " source $HOME/.config/nvim/plug-config/easymotion.vim 
  source $HOME/.config/nvim/plug-config/vim-commentary.vim
  source $HOME/.config/nvim/plug-config/better-whitespace.vim
  source $HOME/.config/nvim/plug-config/fzf.vim
  source $HOME/.config/nvim/plug-config/codi.vim
  " source $HOME/.config/nvim/plug-config/coc/coc.vim
  " source $HOME/.config/nvim/plug-config/coc/coc-extensions.vim
  source $HOME/.config/nvim/plug-config/start-screen.vim
  source $HOME/.config/nvim/plug-config/gitgutter.vim 
  source $HOME/.config/nvim/plug-config/git-messenger.vim
  source $HOME/.config/nvim/plug-config/closetags.vim
  source $HOME/.config/nvim/plug-config/floaterm.vim
  source $HOME/.config/nvim/plug-config/barbar.vim
  source $HOME/.config/nvim/plug-config/tagalong.vim
  source $HOME/.config/nvim/plug-config/markdown-preview.vim
  source $HOME/.config/nvim/plug-config/rainbow.vim
  " source $HOME/.config/nvim/plug-config/minimap.vim
  "  source $HOME/.config/nvim/plug-config/window-swap.vim
  " source $HOME/.config/nvim/plug-config/vim-rooter.vim
  " source $HOME/.config/nvim/plug-config/vimspector.vim
  " source $HOME/.config/nvim/plug-config/sneak.vim
  " source $HOME/.config/nvim/plug-config/illuminate.vim
  " source $HOME/.config/nvim/plug-config/vista.vim
  " source $HOME/.config/nvim/plug-config/xtabline.vim
  " source $HOME/.config/nvim/plug-config/ale.vim
  " luafile $HOME/.config/nvim/lua/nvcodeline.lua
  " luafile $HOME/.config/nvim/lua/user/treesitter.lua "used on lua
  "  luafile $HOME/.config/nvim/lua/plug-colorizer.lua "used on lua
  " source $HOME/.config/nvim/lua/autopairs.vim luafiled
endif
source $HOME/.config/nvim/plug-config/quickscope.vim

 " lua << EOF
" --require("mason-lspconfig").setup()
" --require("headwind").setup({ remove_duplicates:true})
 " EOF

lua << EOF
--require "user.keymaps"
require "user.impatient"
require "user.true-zen"
require "user.plug-colorizer"
require "user.treesitter"
require "user.indentline"
require "user.autopairs"

-- Finders
require "user.nvim-tree"
require "user.telescope"
require "user.harpoon"
require "user.project"

-- Lsp
require "user.lsp.mason"
require "user.lsp.null-ls"
require "user.lsp.lspconfig"
require "user.lsp.lspsaga"
require "user.lsp.lspkind"
require "user.cmp"
require "user.copilot"

EOF

" Add paths to node and python here
if !empty(glob("~/.config/nvim/paths.vim"))
  source $HOME/.config/nvim/paths.vim
endif

" Better nav for omnicomplete 
set guifont=JetBrain\ Operator\ Fira\ Code\ Nerd\ Font

"  inoremap <expr> <c-j> ("\<C-n>") 
"  inoremap <expr> <c-k> ("\<C-p>")
