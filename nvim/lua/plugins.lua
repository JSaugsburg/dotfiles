vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()
  use 'sainnhe/gruvbox-material'
  use 'justinmk/vim-sneak'
  use 'christoomey/vim-tmux-navigator'
  use 'feline-nvim/feline.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'norcalli/nvim-colorizer.lua'
  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'
  }
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }
end)
