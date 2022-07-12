vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()
  use 'sainnhe/gruvbox-material'
  use 'christoomey/vim-tmux-navigator'
  use 'feline-nvim/feline.nvim'
  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'
  }
end)
