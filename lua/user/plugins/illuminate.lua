return {
  "RRethy/vim-illuminate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local illuminate = require("illuminate")
    illuminate.configure({
      -- providers: provider used to get references in the buffer, ordered by priority
      providers = {
        "lsp",
        "treesitter",
        "regex",
      },
      delay = 300,
      under_cursor = true,
      large_file_cutoff = nil,
      large_file_overrides = nil,
      min_count_to_highlight = 2,
    })
    vim.cmd([[
      let g:VM_theme = 'purplegray'
      hi illuminatedWord gui=bolditalic guifg=#828997
      hi IlluminatedWordText gui=bolditalic guifg=#828997
      hi IlluminatedWordRead gui=bolditalic guifg=#828997 guibg=transparent
      if (has("termguicolors"))
          set termguicolors
          " hi LineNr ctermbg=NONE guibg=NONE
      endif
    ]])
  end,
}
