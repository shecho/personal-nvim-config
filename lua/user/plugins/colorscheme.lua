return {
  {
    "navarasu/onedark.nvim",
    priority = 2000, -- make sure to load this before all the other start plugins
    lazy = false,
    config = function()
      --      dark = { -- dark theme palete
      -- 	black = "#181a1f",
      -- 	bg0 = "#282c34",
      -- 	bg1 = "#31353f",
      -- 	bg2 = "#393f4a",
      -- 	bg3 = "#3b3f4c",
      -- 	bg_d = "#21252b",
      -- 	bg_blue = "#73b8f1",
      -- 	bg_yellow = "#ebd09c",
      -- 	fg = "#abb2bf",
      -- 	purple = "#c678dd",
      -- 	green = "#98c379",
      -- 	orange = "#d19a66",
      -- 	blue = "#61afef",
      -- 	yellow = "#e5c07b",
      -- 	cyan = "#56b6c2",
      -- 	red = "#e86671",
      -- 	grey = "#5c6370",
      -- 	light_grey = "#848b98",
      -- 	dark_cyan = "#2b6f77",
      -- 	dark_red = "#993939",
      -- 	dark_yellow = "#93691d",
      -- 	dark_purple = "#8a3fa0",
      -- 	diff_add = "#31392b",
      -- 	diff_delete = "#382b2c",
      -- 	diff_change = "#1c3448",
      -- 	diff_text = "#2c5372",
      -- },
      require("onedark").setup({
        style = "dark", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
        transparent = false, -- Show/hide background
        term_colors = true, -- Change terminal color as per the selected theme style
        ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
        cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
        toggle_style_key = "<leader>aa", -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
        toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer" }, -- List of styles to toggle between
        code_style = {
          comments = "bolditalic",
          keywords = "italic",
          -- functions = "bold",
          strings = "bold",
          -- variables = 'bold',
        },
        lualine = {
          transparent = true, -- lualine center bar transparency
        },
        -- Custom Highlights --
        colors = { blue2 = "#526fff" }, --cyan = "#e06c75"
        highlights = {
          -- General
          -- ["Identifier"] = { fmt = "bold" },
          -- ["Constant"] = { fg = "$red", fmt = "bold" },
          ["CursorLine"] = { fmt = "bolditalic" },
          ["Directory"] = { fmt = "bold" },
          ["MatchParen"] = { fg = "$red", bg = "$bg0", fmt = "bolditalic,underline" },
          ["TabLine"] = { fmt = "bolditalic" },
          ["Keyword"] = { fg = "$purple", fmt = "italic" },
          ["Include"] = { fg = "$purple", fmt = "italic" },
          ["Visual"] = { fmt = "bolditalic" },

          -- Contex
          ["@attribute"] = { fg = "$purple", fmt = "italic" },
          ["@string"] = { fmt = "bold" },
          ["@repeat"] = { fg = "$purple", fmt = "italic" },
          ["@type"] = { fmt = "bold" },
          ["@type.builtin"] = { fmt = "bold" },
          ["@type.definition"] = { fmt = "bold,underline" },
          ["@function.builtin"] = { fg = "$blue2", fmt = "bolditalic" },
          ["@function.method"] = { fg = "$blue2", fmt = "italic" },
          ["@method"] = { fg = "$blue2", fmt = "italic" },
          ["@function.macro"] = { fg = "$cyan", fmt = "italic" },
          ["@interface"] = { fg = "$orange", fmt = "bolditalic" },
          ["@include"] = { fg = "$purple", fmt = "italic" },
          ["@constant"] = { fg = "$purple", fmt = "bold" },
          ["@constant.builtin"] = { fg = "$purple", fmt = "bold" },
          ["@constant.macro"] = { fg = "$purple", fmt = "bold" },
          ["@keyword"] = { fg = "$purple", fmt = "italic" },
          ["@keyword.conditional"] = { fg = "$purple", fmt = "italic" },
          ["@keyword.directive"] = { fg = "$purple", fmt = "italic" },
          ["@keyword.exception"] = { fg = "$purple", fmt = "italic" },
          ["@keyword.function"] = { fg = "$purple", fmt = "italic" },
          ["@keyword.import"] = { fg = "$purple", fmt = "italic" },
          ["@keyword.repeat"] = { fg = "$purple", fmt = "italic" },
          -- ["@keyword.operator"] = { fg = "$purple", fmt = "italic,reverse" },

          ["@label"] = { fg = "$green", fmt = "bold,underline" },
          ["@operator"] = { fg = "$purple" },
          ["@parameter"] = { fg = "$purple", fmt = "bolditalic" },
          ["@parameter.reference"] = { fg = "$purple", fmt = "bolditalic,undercurl" },
          ["@property"] = { fg = "$red", fmt = "bold" },
          ["@property.json"] = { fg = "$red", fmt = "bold" },

          ["@punctuation.delimiter"] = { fmt = "bold" },
          ["@punctuation.bracket"] = { fmt = "bold" },
          ["@punctuation.specifies"] = { fg = "$purple", fmt = "bold" },
          ["@boolean"] = { fg = "$orange", fmt = "bolditalic" },
          -- ["@tags"] = { fg = "$green", fmt = "bold" },
          ["@tag"] = { fg = "$yellow", fmt = "bold" },
          ["@tag.delimiter"] = { fg = "$fg", fmt = "bold" },
          ["@tag.attribute"] = { fg = "$orange", fmt = "bold" },
          ["@variable"] = { fmt = "bold" },
          ["@variable.builtin"] = { fmt = "italic" },
          ["@variable.parameter"] = { fmt = "italic" },
          ["@variable.member"] = { fmt = "italic" },
          ["@lsp.type.property"] = { fg = "$red", fmt = "italic" },
          ["@lsp.type.parameter"] = { fmt = "italic" },
          -- ["TSAttribute"] = { fg = "$red", fmt = "italic" }, --add reverse to make works
          -- ["TSField"] = { fg = "$red", fmt = "italic,reverse" },
          -- tabs BarBar
          ["BufferCurrentIndex"] = { fg = "$fg", bg = "$bg0", fmt = "italic" },
          ["BufferCurrentBtn"] = { fg = "$red", fmt = "italic" },
          ["BufferCurrentHINT"] = { fg = "$red", fmt = "italic" },
          -- LSP
          ["DiagnosticVirtualTextHint"] = { fmt = "bolditalic" },
          ["DiagnosticVirtualTextEror"] = { fmt = "bolditalic" },
        },
        -- Plugins Config --
        diagnostics = {
          darker = true, -- darker colors for diagnostic
          undercurl = true, -- use undercurl instead of underline for diagnostics
          background = true, -- use background color for virtual text
        },
      })
      require("onedark").load()
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  { "rose-pine/neovim", name = "rose-pine" },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
}
