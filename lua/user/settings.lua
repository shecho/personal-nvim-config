vim.cmd([[
	set iskeyword+=-      
	set formatoptions-=cro
	set relativenumber
	syntax enable     
	set hidden        
	set nowrap        
	set encoding=utf-8
	set pumheight=10  
	set fileencoding=utf-8          
	set ruler              			      
	set cmdheight=2                 
	set mouse=a                     
	set splitbelow                  
	set splitright                  
	set t_Co=256                    
	set conceallevel=0              
	set tabstop=4 softtabstop=2
	set shiftwidth=2          
	set smarttab              
	set expandtab             
	set smartindent           
	set autoindent            
	set laststatus=2          
	set number                
	set cursorline            
	set background=dark       
	set showtabline=2         
	set noshowmode            
	set nobackup              
	set nowritebackup         
	set shortmess+=c          
	set signcolumn=yes        
	set updatetime=300        
	set timeoutlen=1000       
	set clipboard=unnamedplus 
	set smartcase
	set incsearch
	set ignorecase
	" let $NVIM_T/UI_ENABLE_TRUE_COLOR=1
	" set mmp=1300
	" set autochdir                           " Your working directory will always be the same as your working directory
	" set foldcolumn=2                        " Folding abilities

	" au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC
	" let g:python3_host_prog = "/usr/bin/python3"
	" let g:loaded_python3_provider = 0
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
	" You can't stop me
	cmap w!! w !sudo tee %
]])
