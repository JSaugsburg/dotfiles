-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
    pattern = 'plugins.lua',
    command = 'source <afile> | PackerCompile',
})

return require('packer').startup({
  function(use)
    use 'wbthomason/packer.nvim'
    --use {
    --  'folke/tokyonight.nvim',
    --  config = function ()
    --    require('tokyonight').setup({
    --      style = 'moon'
    --    })
    --  end
    --}
    --use 'sainnhe/gruvbox-material'
    --use 'luisiacc/gruvbox-baby'
    use {
      'navarasu/onedark.nvim',
      config = function()
        require('js.pluginconfigs.onedark')
      end
    }
    use 'jpalardy/vim-slime'
    use 'christoomey/vim-tmux-navigator'
    use {
      'feline-nvim/feline.nvim',
      config = function()
        require('js.pluginconfigs.feline')
      end
    }
    use 'kyazdani42/nvim-web-devicons'
    use {
      'norcalli/nvim-colorizer.lua',
      config = function()
        require('colorizer').setup()
      end
    }
    use {
      'toppair/peek.nvim', run = 'deno task --quiet build:fast',
      config = function()
        require('peek').setup()
      end
    }
    use {
      'nvim-telescope/telescope.nvim', branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} },
      config = function()
        require('js.pluginconfigs.telescope')
      end
    }
    use 'nvim-telescope/telescope-file-browser.nvim'
    use 'cljoly/telescope-repo.nvim'
    use {
      'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
      config = function()
        require('js.pluginconfigs.treesitter')
      end
    }
    use {
      'lewis6991/gitsigns.nvim',
      config = function()
        require('gitsigns').setup()
      end
    }
    use {
      'neovim/nvim-lspconfig',
      config = function()
        require('js.pluginconfigs.lspconfig')
      end
    }
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-calc'
    use {
      'hrsh7th/nvim-cmp',
      config = function()
        require('js.pluginconfigs.cmp')
      end
    }
    use 'onsails/lspkind.nvim'
    use {
      'L3MON4D3/LuaSnip',
      config = function()
        require('luasnip.loaders.from_vscode').lazy_load()
      end
    }
    use 'rafamadriz/friendly-snippets'
    use 'saadparwaiz1/cmp_luasnip'
    use 'andersevenrud/cmp-tmux'
    use {
      'windwp/nvim-autopairs',
      config = function() require('nvim-autopairs').setup {} end
    }
    use {
      'kyazdani42/nvim-tree.lua',
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = function() require('nvim-tree').setup() end
    }
  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end,
    },
  },
})