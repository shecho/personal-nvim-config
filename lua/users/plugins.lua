local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  -- snapshot = "july-24",
  snapshot_path = fn.stdpath("config") .. "/snapshots",
  max_jobs = 50,
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
    prompt_border = "rounded", -- Border style of prompt popups.
  },
})

-- Install your plugins here
return packer.startup(function(use)
  -- Completion
  -- use({ "tzachar/cmp-tabnine", commit = "1a8fd2795e4317fd564da269cc64a2fa17ee854e", run = "./install.sh" })

  -- Syntax/Treesitter
  use("windwp/nvim-ts-autotag")

  -- Marks
  use("christianchiarulli/harpoon")

  -- Color
  use("NvChad/nvim-colorizer.lua")
  -- use("nvim-colortils/colortils.nvim")

  -- Colorschemes
  use("lunarvim/onedarker.nvim")
  use("lunarvim/darkplus.nvim")
  use("folke/tokyonight.nvim")

  -- Utility
  use("rcarriga/nvim-notify")
  use("stevearc/dressing.nvim")
  use("ghillb/cybu.nvim")
  use("moll/vim-bbye")

  -- Comment

  -- Terminal
  use("akinsho/toggleterm.nvim")

  -- Project
  use("windwp/nvim-spectre")

  -- Session
  use("rmagatti/auto-session")
  use("rmagatti/session-lens")

  -- Quickfix
  use("kevinhwang91/nvim-bqf")

  -- Git
  use("lewis6991/gitsigns.nvim")
  use("f-person/git-blame.nvim")
  use("ruifm/gitlinker.nvim")
  use("mattn/vim-gist")
  use("mattn/webapi-vim")

  -- Github
  use("pwntester/octo.nvim")

  -- Editing Support
  use("windwp/nvim-autopairs")
  use("karb94/neoscroll.nvim")

  -- Motion

  use("Saecki/crates.nvim")

  -- use "metakirby5/codi.vim"
  -- use "unblevable/quick-scope"
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
