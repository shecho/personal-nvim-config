"Vim Commentary General Settings

source $HOME/.config/nvim/vim-plug/plugins.vim
" source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/functions.vim
source $HOME/.config/nvim/themes/airline.vim
  " Themes
source $HOME/.config/nvim/themes/onedark.vim
  " source $HOME/.config/nvim/themes/syntax.vim
  " source $HOME/.config/nvim/themes/nvcode.vim
  " luafile $HOME/.config/nvim/themes/oneDark.lua

" require "user.impatient"
lua << EOF
--require "user.settings"
--require "user.options" -- Some options missing from settings.vim file
require "user.keymaps"
require "user.illuminate"
require "user.true-zen"
require "user.plug-colorizer"
require "user.treesitter"
require "user.indentline"
require "user.autopairs"
require "user.autotag"
require "user.barbar"

-- Finders
require "user.nvim-tree"
require "user.telescope"
require "user.harpoon"
require "user.project"
--" require "user.copilot"

EOF

" source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/keys/which-key.vim

 " VS Code extension
  " Plugin Configuration
  source $HOME/.config/nvim/plug-config/vim-commentary.vim
  source $HOME/.config/nvim/plug-config/better-whitespace.vim
  source $HOME/.config/nvim/plug-config/fzf.vim
  source $HOME/.config/nvim/plug-config/codi.vim
  source $HOME/.config/nvim/plug-config/start-screen.vim
  source $HOME/.config/nvim/plug-config/gitgutter.vim 
  source $HOME/.config/nvim/plug-config/git-messenger.vim
  source $HOME/.config/nvim/plug-config/floaterm.vim
  source $HOME/.config/nvim/plug-config/rainbow.vim
  source $HOME/.config/nvim/plug-config/quickscope.vim

lua << EOF

require "user.cmp"
require "user.copilot"

-- Lsp
require "user.lsp.lspsaga"
require "user.luasnip"
require "user.lsp.lspconfig"
require "user.lsp.mason"
require "user.lsp.null-ls"
require "user.lsp.lspkind"
vim.opt.guifont = "Hack nerd font"

EOF


" Add paths to node and python here
if !empty(glob("~/.config/nvim/paths.vim"))
  source $HOME/.config/nvim/paths.vim
endif

" set guifont=JetBrain\ Operator\ Fira\ Code\ Hack\ Nerd\ Font

"  inoremap <expr> <c-j> ("\<C-n>") 
"  inoremap <expr> <c-k> ("\<C-p>")
