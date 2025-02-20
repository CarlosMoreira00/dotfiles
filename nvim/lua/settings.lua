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

-- -- folding de linhas
opt.foldmethod = "manual"      
opt.foldenable = true        
opt.foldlevel = 99         
opt.foldlevelstart = 99 

-- Theme
vim.cmd [[ set background=dark ]]
vim.cmd [[ colorscheme jellybeans ]]

-- neoformat
vim.cmd [[autocmd BufWritePre * Neoformat]]
vim.g.neoformat_enable_javascript = {'prettier'}
vim.g.neoformat_enable_html = {'prettier'}
vim.g.neoformat_python = {'black'}

opt.termguicolors = true

-- Editor
opt.tabstop = 2 
opt.shiftwidth = 2 
opt.wrap = false
opt.signcolumn = 'yes'
opt.showmatch = true
opt.showmode = false

--opt.foldmethod = 'marker'
opt.splitright = true
opt.splitbelow = true

-- File manager
api.nvim_set_keymap('n', '<Leader>da', ':Lexplore<CR>', { noremap = true })
api.nvim_set_keymap('n', '<Leader>c', ':%s/\r//g<CR>', { noremap = true })
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

-- Vue setting plugin
vim.g.vim_vue_plugin_config = {
  syntax = {
    template = {'html'},
    script = {'javascript'},
    style = {'css'}
  },
  full_syntax = {},
  initial_indent = {},
  attribute = 0,
  keyword = 0,
  foldexpr = 0,
	debug = 0,
}

-- cmp
local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specy a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
      end,
    },
    window = {
    	completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			['<Tab>'] = cmp.mapping(function(fallback)
				local feedkey = function(key, mode)
				  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
				end

				local has_words_before = function()
					local line, col = unpack(vim.api.nvim_win_get_cursor(0))
					return col ~= 0 and vim.api.nvim_get_current_line():sub(col, col):match('%s') == nil
				end

				if vim.fn['vsnip#available']() == 1 then
				  feedkey('<Plug>(vsnip-expand)', '')
        elseif vim.fn.pumvisible() == 1 then
			    feedkey('<C-n>', 'n')
				elseif has_words_before() then
			    cmp.complete()
				else
				  fallback()
				end	
			end, {'i', 's'}),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` ( you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' ( you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  require('lspconfig').ts_ls.setup { capabilities = capabilities }
	require('lspconfig').pyright.setup { capabilities = capabilities }

	-- Vim tmux
cmd = {
	"TmuxNavigateLeft",
	"TmuxNavigateDown",
	"TmuxNavigateUp",
	"TmuxNavigateRight",
	"TmuxNavigatePrevious",
	"TmuxNavigatorProcessList",
 }

keys = {
	{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
	{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
	{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
	{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
	{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
}
