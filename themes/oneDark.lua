require("onedark").setup({
  -- Main options --
  style = "darker", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
  transparent = false, -- Show/hide background
  term_colors = true, -- Change terminal color as per the selected theme style
  ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
  cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

  -- toggle theme style ---
  toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
  toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

  -- Change code style ---
  -- Options are italic, bold, underline, none
  -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
  code_style = {
    comments = "bolditalic",
    -- keywords = 'italic',
    functions = "bold",
    strings = "bold",
    -- variables = 'bold',
  },

  -- Lualine options --
  lualine = {
    transparent = false, -- lualine center bar transparency
  },

  -- Custom Highlights --
  colors = {}, --
  highlights = {
    ["@keyword"] = { fg = "$purple", fmt = "bolditalic" },
    ["@string"] = { fmt = "bold" },
    ["@function"] = { fmt = "bold" },
    ["@function.builtin"] = { fg = "$cyan", fmt = "bold,underline" },
    ["@operator"] = { fg = "$purple", fmt = "bold" },
    ["@interface"] = { fg = "$orange", fmt = "bold" },
    ["@type"] = { fmt = "bolditalic" },
    ["@include"] = { fg = "$purple", fmt = "italic" },
    ["@constant"] = { fg = "$green", fmt = "bold" },
    ["@tags"] = { fg = "$green", fmt = "bold" },
    ["@label"] = { fg = "$green", fmt = "bold" },
    ["@parameter"] = { fg = "$cyan", fmt = "bolditalic" },
    ["@property"] = { fg = "", fmt = "bold" },
    ["@punctuation.delimiter"] = { fg = "$purple", fmt = "bold" },
    ["@punctuation.bracket"] = { fg = "$purple", fmt = "bold" },
    ["@punctuation.specifies"] = { fg = "$purple", fmt = "bold" },
    ["@boolean"] = { fg = "$orange", fmt = "bolditalic" },
    ["@repeat"] = { fg = "$purple", fmt = "italic" },
    ["@tag"] = { fg = "$blue", fmt = "bold" },
    ["@tag.delimiter"] = { fg = "$purple", fmt = "bold" },
    -- ["@property"] = {fg= "$purple", fmt = 'bold'}
  },
  -- Plugins Config --
  diagnostics = {
    darker = true, -- darker colors for diagnostic
    undercurl = true, -- use undercurl instead of underline for diagnostics
    background = true, -- use background color for virtual text
  },
})
require("onedark").load()
