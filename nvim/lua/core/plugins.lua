local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim"
  -- Only required if you have packer configured as `opt`
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- All plugins here
  use 'lewis6991/impatient.nvim'                        -- improve startup time for Neovim
  use 'wbthomason/packer.nvim'                          -- Have packer manage itself
  use "max397574/better-escape.nvim"                    -- escape from insert mode without delay when typing
  use "kyazdani42/nvim-tree.lua"                        -- A file explorer tree
  use "kyazdani42/nvim-web-devicons"
  use "akinsho/bufferline.nvim"                         -- a snazzy bufferline for neovim
  use "lukas-reineke/indent-blankline.nvim"             -- indent guides for neovim
  use "numToStr/Comment.nvim"                           -- comment plugin
  use "windwp/nvim-autopairs"                           -- autopairs for neovim

  -- LSP
  use "neovim/nvim-lspconfig"                           -- quick start configs for neovim LSP
  -- use "williamboman/nvim-lsp-installer"                 -- simple to use lang server installer
  use "tamago324/nlsp-settings.nvim"                    -- language server settings defined in json

  -- cmp plugins
  use "hrsh7th/nvim-cmp"                                -- the completion plugin
  use "hrsh7th/cmp-buffer"                              -- buffer completions
  use "hrsh7th/cmp-path"                                -- path completions
  use "hrsh7th/cmp-nvim-lua"
  use "L3MON4D3/LuaSnip"
  use "hrsh7th/cmp-nvim-lsp"
  use "saadparwaiz1/cmp_luasnip"                        -- snippet completions
  
  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- colorizer
  use "norcalli/nvim-colorizer.lua"

  -- colorscheme
  use "folke/tokyonight.nvim"

  -- statusline
  use "nvim-lualine/lualine.nvim"

  -- telescope
  use {
    "nvim-telescope/telescope.nvim",
    requires = { {"nvim-lua/plenary.nvim"} }
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
