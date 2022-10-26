local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

-- manual installation steps for the plugins:
-- - install nerdfont

-- vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
}
 -- better syntax highlighting, also used by telescope
 use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'tamton-aquib/staline.nvim' -- Status line
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  -- use {
  --  'fatih/vim-go',
  --   run = ':GoUpdateBinaries'
  -- }
  use 'SirVer/ultisnips'
  use 'cohama/lexima.vim' -- auto closing features
use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
  tag = 'nightly' -- optional, updated every week. (see issue #1193)
}
  -- color themes
  -- important, run :PackerCompile after :PackerInstall !
  use {
    "sonph/onehalf",
    rtp = "vim",
    config = function() vim.cmd("colorscheme onehalfdark") end
  }
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip' -- Snippet engine
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovims built-in language server client
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'ThePrimeagen/harpoon'
  use 'christoomey/vim-tmux-navigator' -- todo: not working...
  use 'kdheepak/lazygit.nvim' -- todo: color problems (maybe remove it)
  use 'voldikss/vim-floaterm'
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  use { 
    'folke/lsp-colors.nvim',
    config = function()
      require("lsp-colors").setup({
        Error = "#db4b4b",
        Warning = "#e0af68",
        Information = "#0db9d7",
        Hint = "#10B981"
      })
    end
  }
end)

