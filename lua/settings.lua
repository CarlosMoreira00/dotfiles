local g = vim.g
local opt = vim.opt
local cmd = vim.cmd
local api = vim.api

-- Definir a tecla espaço como leader
api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
g.mapleader = ' '
g.maplocalleader = ' '

-- General
opt.number = true
opt.mouse = 'a'	
opt.swapfile = false
opt.hidden = true
opt.history = 100
opt.lazyredraw = true
opt.synmaxcol = 240

-- Theme
vim.cmd [[ set background=dark ]]
vim.cmd [[ colorscheme jellybeans ]]
opt.termguicolors = true

-- Editor
opt.tabstop = 2 
opt.shiftwidth = 2 
opt.wrap = false
opt.signcolumn = 'yes'
opt.showmatch = true
opt.showmode = false
opt.foldmethod = 'marker'
opt.splitright = true
opt.splitbelow = true

-- File manager
api.nvim_set_keymap('n', '<Leader>da', ':Lexplore<CR>', { noremap = true })
g.netrw_liststyle = 3
g.netrw_banner = 0
g.netrw_winsize = 15

-- Navegação entre os splits usando Ctrl + hjkl
api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })
api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })
api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })
api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })

-- Redimensionar splits usando ctrl + h/j/k/l
vim.api.nvim_set_keymap('n', '<C-Left>', '<C-w><', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-Down>', '<C-w>-', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-Up>', '<C-w>+', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-Right>', '<C-w>>', { noremap = true })
