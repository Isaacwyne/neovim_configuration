-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- escape from insert mode without delay when typing
  use {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end
  }

  -- A file explorer tree 
  use {
    'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'},           -- optional for file icons
    config = function()
      require("nvim-tree").setup()
    end
  }

  -- indent guides for neovim
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent-blankline").setup {
        -- for example, context is off by default, use this to turn it on
        show_current_context = true,
        show_current_context_start = true,
      }
    end
  }

  -- comment plugin
  use {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end
  }
  
  -- autopairs for neovim
  use {
      "windwp/nvim-autopairs",
      config = function()
          require("nvim-autopairs").setup {}
      end
  }
  

end)
