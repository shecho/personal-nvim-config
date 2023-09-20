return {
  {
    "luochen1990/rainbow",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      vim.cmd([[
            let g:rainbow_conf = {'guis': ['bold']}

            let g:rainbow_active = 1 "set to 0 if you want to enable it later via :rainbowtoggle
            let g:rainbow_conf = {
            \	'guifgs': ['#858580', '#8fbcbb', '#d08770', '#a3be8c', '#ebcb8b', '#b48ead', '#80a880', '#887070'],
            \	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
            \	'guis': [''],
            \	'cterms': [''],
            \	'operators': '_,_',
            \	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
            \	'separately': {
            \		'*': {},
            \		'markdown': {
            \			'parentheses_options': 'containedin=markdowncode contained',
            \		},
            \		'lisp': {
            \	    'guifgs': ['#858580', '#8fbcbb', '#d08770', '#a3be8c', '#ebcb8b', '#b48ead', '#80a880', '#887070'],
            \		},
            \		'jsx': {
            \	    'guifgs': ['#858580', '#8FBCBB', '#D08770', '#A3BE8C', '#EBCB8B', '#B48EAD', '#80a880', '#887070'],
            \		},
            \		'haskell': {
            \			'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'],
            \		},
            \		'vim': {
            \			'parentheses_options': 'containedin=vimFuncBody',
            \		},
            \		'perl': {
            \			'syn_name_prefix': 'perlBlockFoldRainbow',
            \		},
            \		'stylus': {
            \			'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'],
            \		},
            \		'css': 0,
            \	}
            \}
              ]])
    end,
  },
}
