return require("packer").startup(function()
	use "lewis6991/impatient.nvim"
	use "wbthomason/packer.nvim"
	use "sainnhe/gruvbox-material"
	use "arcticicestudio/nord-vim"
--	use "feline-nvim/feline.nvim"
	use "kyazdani42/nvim-web-devicons"
	use {
	  "lewis6991/gitsigns.nvim",
	  requires = { {"nvim-lua/plenary.nvim"} }
        }
	use {
	  "nvim-telescope/telescope.nvim",
	  requires = { {"nvim-lua/plenary.nvim"} }
        }
	use {
	  "nvim-treesitter/nvim-treesitter",
	  run = ":TSUpdate"
        }
	use {
	  "SmiteshP/nvim-gps",
	  requires = "nvim-treesitter/nvim-treesitter"
        }
	use {
	  "nvim-lualine/lualine.nvim",
	  requires = { "kyazdani42/nvim-web-devicons", opt = true }
	}
end)
