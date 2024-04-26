require 'plugins'
require 'settings'

-- lsp
local lspconfig = require('lspconfig')
--lspconfig.tsserver.setup{}
lspconfig.pyright.setup {}

-- autocomplete
local compe = require('compe')
compe.setup({
	enabled = true,
	source = {
		path = true,
		buffer = true,
		nvim_lsp = true
	}
})

-- lua-line
require('lualine').setup({
	options = {
		icons_enabled = false,
  	theme = 'iceberg_dark'
  },
  	sections = {
    	lualine_a = { 'mode' },
      lualine_b = { 'branch' },
      lualine_c = { 'filename' },
      lualine_x = { 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    }
  })

-- Telescope
vim.api.nvim_set_keymap('n', '<leader>q', ':Telescope find_files<CR>', {noremap = true})

-- Auto-pair
require("nvim-autopairs").setup {}
