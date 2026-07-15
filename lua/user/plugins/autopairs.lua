return {
  {
    "saghen/blink.pairs",
    version = "*", -- required for prebuilt binaries
    event = "InsertEnter",

    -- blink.pairs v0.6+ requires blink.lib (renamed from blink.download)
    dependencies = "saghen/blink.lib",
    -- download prebuilt binaries from github releases; without this, blink.pairs
    -- can't find its native parser lib and setup() silently no-ops (no auto-pairing)
    build = function()
      require("blink.pairs").download():pwait(60000)
    end,
    -- OR build from source with nix
    -- build = "nix build .#build-plugin",

    --- @module 'blink.pairs'
    --- @type blink.pairs.Config
    opts = {
      mappings = {
        -- you can call require("blink.pairs.mappings").enable() and require("blink.pairs.mappings").disable() to enable/disable mappings at runtime
        enabled = true,
        -- see the defaults: https://github.com/Saghen/blink.pairs/blob/main/lua/blink/pairs/config/mappings.lua#L10
        pairs = {},
      },
      highlights = {
        enabled = false,
        -- groups = {
        --   "BlinkPairsOrange",
        --   "BlinkPairsPurple",
        --   "BlinkPairsBlue",
        -- },
        matchparen = {
          enabled = true,
          -- group = "MatchParen",
          group = "BlinkPairsMatchParen",
        },
      },
      debug = false,
    },
  },
  -- {
  --   "windwp/nvim-autopairs",
  --   event = { "InsertEnter" },
  -- dependencies = { "hrsh7th/nvim-cmp", },
  --   opts = function()
  --     -- import nvim-autopairs
  --     local autopairs = require("nvim-autopairs")
  --
  --     return {
  --       check_ts = true,
  --       ts_config = {
  --         lua = { "string" },
  --         javascript = { "template_string" },
  --         java = false,
  --       },
  --     }
  --   end,
  -- },
}
