local cmd = vim.cmd
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'pantharshit00/coc-prisma'
Plug 'prisma/vim-prisma'
Plug 'windwp/nvim-autopairs'
Plug 'tpope/vim-commentary'

Plug 'nanotech/jellybeans.vim'
Plug 'cocopon/iceberg.vim'
vim.call('plug#end')
