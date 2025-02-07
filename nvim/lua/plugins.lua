local cmd = vim.cmd
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-cmdline'

Plug 'sbdchd/neoformat'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'pantharshit00/coc-prisma'
Plug 'prisma/vim-prisma'
Plug 'windwp/nvim-autopairs'
Plug 'tpope/vim-commentary'
Plug 'leafOfTree/vim-vue-plugin'

Plug 'nanotech/jellybeans.vim'
Plug 'cocopon/iceberg.vim'
vim.call('plug#end')
