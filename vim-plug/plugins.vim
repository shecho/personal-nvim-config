" auto-install vim-plugplugin
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

  if exists('g:vscode')
    " Easy motion for VSCode
    " Plug 'asvetliakov/vim-easymotion'
    "  Plug 'ChristianChiarulli/vscode-easymotion'plugis
  else
    " Loaderc
    Plug 'lewis6991/impatient.nvim'
    
    Plug 'windwp/nvim-autopairs'
    Plug 'windwp/nvim-ts-autotag'
    " taildwind
    " Plug 'rodrigore/coc-tailwind-intellisense', {'do': 'npm install'}
    "  Plug 'iamcco/coc-tailwindcss',  {'do': 'yarn install --frozen-lockfile && yarn run build'}
    "  Plug 'steelsojka/headwind.nvim'
    "  Plug 'ThePrimeagen/git-worktree.nvim'

    " Better Comments
    Plug 'tpope/vim-commentary'

    " Change dates fastplugin
    " Plug 'tpope/vim-speeddating'

    " Convert binary, hex, etc..
    Plug 'glts/vim-radical'

    " Repeat stuff
    Plug 'tpope/vim-repeat'

    " Text Navigation
    Plug 'unblevable/quick-scope'

    " Useful for React Commenting 
    Plug 'suy/vim-context-commentstring'

    " highlight all matches under cursor
    " Plug 'RRethy/vim-illuminate'


    " Projects 
    Plug 'ahmedkhalf/project.nvim'
    " Easymotion
    " Plug 'easymotion/vim-easymotion'
    " Surround
    Plug 'tpope/vim-surround'

    " Have the file system follow you around
    Plug 'airblade/vim-rooter'

    " auto set indent settings
    Plug 'tpope/vim-sleuth'

    " Better Syntax Support
    " Plug 'sheerun/vim-polyglot'

    " Treesitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/playground'
    Plug 'nvim-treesitter/nvim-treesitter-refactor'
    Plug 'romgrk/nvim-treesitter-context'

    " Cool Icons
    " Plug 'kyazdani42/nvim-web-devicons'
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'nvim-tree/nvim-tree.lua'
    Plug 'ryanoasis/vim-devicons'

    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Closetags
    Plug 'alvan/vim-closetag'

    " Themes
    " Plug 'christianchiarulli/onedark.vim'
    " Plug 'christianchiarulli/nvcode-color-schemes.vim'
    " Plug 'sainnhe/edge'
    " Plug 'dracula/dracula-theme'
    " Plug 'sonph/onehalf'
    " Plug 'joshdick/onedark.vim'
    " Plug 'christianchiarulli/nvcode-color-schemes.vim'
    Plug 'rakr/vim-one'
    Plug 'navarasu/onedark.nvim'

    " Intellisense
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Status Line
    Plug 'vim-airline/vim-airline'

    " FZF
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins' }

    " Telescope 
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    " Plug 'fannheyward/telescope-coc.nvim'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-telescope/telescope-ui-select.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

    " Git
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'
    Plug 'rhysd/git-messenger.vim'
    Plug 'f-person/git-blame.nvim'   

    " Terminal
    Plug 'voldikss/vim-floaterm'
    "  Plug 'francoiscabrol/ranger.vim'
    Plug 'kevinhwang91/rnvimr'
    Plug 'rbgrouleff/bclose.vim'

    " Start Screen
    Plug 'mhinz/vim-startify'

    " Vista
    Plug 'liuchengxu/vista.vim'

    " See what keys do like in emacs
    Plug 'liuchengxu/vim-which-key'
    " Plug 'folke/which-key.nvim'

    " Zen mode
    Plug 'Pocco81/true-zen.nvim'
    Plug 'folke/zen-mode.nvim'

    " Snippets
    " Plug 'honza/vim-snippets'
    Plug 'mattn/emmet-vim'

    " Interactive code
    Plug 'metakirby5/codi.vim'

    " Better tabline
    Plug 'romgrk/barbar.nvim'

    " undo time travel
    Plug 'mbbill/undotree'

    " Auto change html tags
    Plug 'AndrewRadev/tagalong.vim'

    " live server

    " Smooth scroll
    Plug 'psliwka/vim-smoothie'

    " Swap windows
    " Plug 'wesQ3/vim-windowswap'

    " Markdown Preview
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }

    " Easily Create Gists
    " Plug 'mattn/vim-gist'
    " Plug 'mattn/webapi-vim'

    " Colorizer
    Plug 'norcalli/nvim-colorizer.lua'

    " Intuitive buffer closing
    Plug 'moll/vim-bbye'

    " Debugging
    Plug 'puremourning/vimspector'
    Plug 'szw/vim-maximizer'


    " Neovim in Browser
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
    " Rainbow brackets
    Plug 'luochen1990/rainbow'

    " Multiple Cursors
    Plug 'terryma/vim-multiple-cursors'
    " Plug 'mg979/vim-visual-multi', {'branch': 'master'}

    " Async Linting Engine
    Plug 'ntpeters/vim-better-whitespace'

    " Sneak
    " Plug 'justinmk/vim-sneak'

    " Minimap
    " Plug 'wfxr/minimap.vim'

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'lukas-reineke/indent-blankline.nvim'


    " Making stuff
    Plug 'wbthomason/packer.nvim'
    Plug 'ThePrimeagen/harpoon'
    Plug 'prabirshrestha/vim-lsp'

    "native lsp 
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'

    Plug 'onsails/lspkind.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'kabouzeid/nvim-lspinstall'
    Plug 'VonHeikemen/lsp-zero.nvim'
    Plug 'jose-elias-alvarez/typescript.nvim'

    " Linting 
    Plug 'jose-elias-alvarez/null-ls.nvim'
    Plug 'jayp0521/mason-null-ls.nvim'

    " completions
    Plug'hrsh7th/cmp-nvim-lsp'
    Plug'hrsh7th/nvim-cmp'
    Plug'hrsh7th/cmp-buffer'
    Plug'hrsh7th/cmp-path'
    Plug 'glepnir/lspsaga.nvim' 
    Plug 'hrsh7th/cmp-nvim-lua'
    Plug 'hrsh7th/cmp-cmdline'
    " For vsnip users.
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'


    " for ultisnips users.
    Plug 'SirVer/ultisnips'
    Plug 'quangnguyen30192/cmp-nvim-ultisnips'

    " For snippy users.
    Plug 'dcampos/nvim-snippy'
    Plug 'dcampos/cmp-snippy'

    "  Snippets
    Plug 'L3MON4D3/LuaSnip'
    Plug 'rafamadriz/friendly-snippets'
    Plug 'L3MON4D3/LuaSnip'
    Plug 'saadparwaiz1/cmp_luasnip'


    Plug 'zbirenbaum/copilot.lua'
    Plug 'github/copilot.vim'
    Plug 'zbirenbaum/copilot-cmp'


  endif

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
