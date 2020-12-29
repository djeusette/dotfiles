-------------------- HELPERS -------------------------------
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local scopes = {
  o = vim.o,  -- Global options
  b = vim.bo, -- Buffer-scoped options
  w = vim.wo  -- Window-scoped options
}

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-------------------- PLUGINS -------------------------------
cmd 'packadd paq-nvim'               -- load the package manager
local paq = require('paq-nvim').paq  -- a convenient alias
paq {'savq/paq-nvim', opt = true}    -- paq-nvim manages itself
paq {'shougo/deoplete-lsp'}
paq {'shougo/deoplete.nvim', hook = fn['remote#host#UpdateRemotePlugins']}
paq {'nvim-treesitter/nvim-treesitter'}
paq {'neovim/nvim-lspconfig'}
paq {'junegunn/fzf', hook = fn['fzf#install']}
paq {'junegunn/fzf.vim'}
paq {'scrooloose/nerdtree'}
paq {'scrooloose/nerdcommenter'}
paq {'neomake/neomake'}
paq {'ojroques/nvim-lspfuzzy'}
paq {'NLKNguyen/papercolor-theme'}
paq {'vim-airline/vim-airline'}
paq {'vim-airline/vim-airline-themes'}
paq {'airblade/vim-gitgutter'}
paq {'ctrlpvim/ctrlp.vim'}
paq {'vim-test/vim-test'}
paq {'dense-analysis/ale'}
paq {'tpope/vim-projectionist'}
-- Elixir specific --
paq {'elixir-editors/vim-elixir'}
paq {'tpope/vim-dispatch'}

-------------------- Variables -------------------------------
g['mapleader'] = ' '                       -- Make SPACE leader
g['grepprg'] = 'rg --color=never'

-- deoplete
opt('o', 'completeopt', 'menuone,noinsert,noselect')
g['deoplete#enable_at_startup'] = 1
fn['deoplete#custom#option']('ignore_case', false)
fn['deoplete#custom#option']('max_list', 10)
-- NERDTree --
g['NERDTreeWinSize'] = 50
g['NERDTreeQuitOnOpen'] = 1
g['NERDTreeHijackNetrw'] = 1
g['NERDTreeShowLineNumbers'] = 1
-- Papercolor --
g['PaperColor_Theme_Options'] = {
  ['theme'] = {
    ['default'] = {
      ['allow_italic'] = 1
    }
  }
}
-- neomake --
g['neomake_open_list'] = 2
g['neomake_list_height'] = 10
g['neomake_elixir_enabled_makers'] = {'credo'}
g['neomake_markdown_enabled_makers'] = {}
fn['neomake#configure#automake']('rw', 1000)
-- vim-airline --
g['airline#extensions#tabline#enabled'] = 1
g['airline#extensions#tabline#left_sep'] = ' '
g['airline#extensions#tabline#left_alt_sep'] = '|'
g['airline#extensions#tabline#formatter'] = 'unique_tail_improved'
g['airline_theme'] ='papercolor'
-- vim-gitgutter --
g['gitgutter_max_signs'] = 500
g['gitgutter_override_sign_column_highlight'] = 0
g['gitgutter_map_keys'] = 0
g['gitgutter_highlight_lines'] = 0
-- ctrlp --
g['ctrlp_user_command']  = 'rg %s --files --hidden --glob "!.git/*"'
g['ctrlp_use_caching'] = 0
-- fzf --
local FZF_DEFAULT_COMMAND = 'rg --files --hidden'
vim.api.nvim_command('command! -bang -nargs=* Rg call fzf#vim#grep(\'rg --column --line-number --no-heading --fixed-strings --smart-case --hidden --follow --color=always --glob "!.git/*" \'.shellescape(<q-args>), 1, <bang>0)')
g['fzf_action'] = {
  ['ctrl-t'] = 'tab split',
  ['ctrl-s'] = 'split',
  ['ctrl-v'] = 'vsplit'
}
g['fzf_preview_window'] = {'right:40%:hidden', 'ctrl-/'}
-- nerdcommenter --
g['NERDSpaceDelims'] = 1
-- vim-test --
g['test#strategy'] = 'dispatch'
-- ale --
g['ale_fixers'] = {
['elixir'] = {'mix_format'},
['css'] = {'prettier'},
['json'] = {'prettier'},
['typescript'] = {'prettier'},
['typescriptreact'] = {'prettier'},
['*'] = {'remove_trailing_lines', 'trim_whitespace'},
}
g['ale_linters'] = {
['typescript'] = {'eslint'},
['typescriptreact'] = {'eslint'},
}
g['ale_fix_on_save'] = 1
g['ale_linters_explicit'] = 1
g['ale_disable_lsp'] = 1

-------------------- OPTIONS -------------------------------
local indent = 2
cmd 'colorscheme papercolor'
opt('o', 'encoding', 'utf-8')              -- File encoding
opt('o', 'clipboard', 'unnamed,unnamedplus') -- Use cross-platform clipboard
opt('o', 'autowriteall', true)              -- Save often automatically
opt('o', 'autoread', true)              -- Reload file automatically
opt('o', 'background', 'light')              -- background for papercolor
opt('w', 'cursorline', true)                -- Enable line highlighting
opt('w', 'cursorcolumn', true)              -- Enable column highlighting
opt('w', 'signcolumn', 'yes')              -- Show sign column
opt('b', 'swapfile', false)                     -- Do not use swap files
opt('o', 'backup', false)                       -- Do not keep a backup file
opt('b', 'textwidth', 80)              -- Specify the text width
opt('w', 'colorcolumn', '+1')              -- Enable column highlighting
opt('o', 'switchbuf', 'useopen')           -- Switch buffers
opt('o', 'showcmd', true)                  -- Display incomplete commands
opt('o', 'title', true)                    -- Set title of the terminal
opt('b', 'expandtab', true)                -- Use spaces instead of tabs
opt('o', 'smarttab', true)                 -- Insert indents automatically
opt('b', 'softtabstop', indent)
opt('b', 'tabstop', indent)                -- Number of spaces tabs count for
opt('b', 'smartindent', true)              -- Insert indents automatically
opt('b', 'shiftwidth', indent)             -- Size of an indent
opt('o', 'shiftround', true)
opt('o', 'showmatch', true)                -- Show matching braces
opt('o', 'hidden', false)                  -- Enable or disabled modified buffers in background
opt('o', 'ttyfast', true)                  -- We are connected to a fast terminal
opt('o', 'laststatus', 2)                  -- Keep the status line
opt('o', 'incsearch', true)                -- Enable incremental search
opt('o', 'ignorecase', true)               -- Ignore case
opt('o', 'joinspaces', false)              -- No double spaces with join after a dot
opt('o', 'scrolloff', 4 )                  -- Lines of context
opt('o', 'shiftround', true)               -- Round indent
opt('o', 'sidescrolloff', 8 )              -- Columns of context
opt('o', 'smartcase', true)                -- Don't ignore case with capitals
opt('o', 'splitright', true)               -- Put new windows right of current
opt('o', 'splitbelow', true)               -- Put new windows below current
opt('o', 'termguicolors', true)            -- True color support
opt('o', 'wildmode', 'longest:full,full')  -- Command-line completion mode
opt('w', 'list', true)                     -- Show some invisible characters (tabs etc.)
opt('w', 'listchars', 'tab:»·,trail:·,nbsp:·')              -- Display extra whitespaces
opt('w', 'number', true)                   -- Print line number
opt('w', 'relativenumber', true)           -- Print relative line number
-- Line wrap
opt('w', 'breakindent', true)
opt('w', 'linebreak', true)
opt('w', 'wrap', true)
-- opt('w', 'wrap', false)                    -- Disable line wrap

-------------------- MAPPINGS ------------------------------
map('', ';', ':')                 -- Use ; for commands
-- nerdtree
map('n', '<leader>n', '<cmd>NERDTreeToggle<CR>') -- Toggle NERDTree
-- built-in
map('n', '<leader><leader>', '<c-^>') -- Switch between last used buffers
-- CtrlP
map('n', '<leader>b', '<cmd>CtrlPBuffer<CR>') -- Open buffer menu
map('n', '<leader>f', '<cmd>CtrlPMRUFiles<CR>') -- Open most recently used files menu
-- built-in + fzf
map('n', '<Leader>o', '<cmd>Files<CR>') -- Open file menu
-- rg
map('n', '\\', ':Rg<SPACE>') -- Prepare rg query
-- nerdcommenter
map('', '<C-C>', ':call NERDComment("n", "AlignLeft")<CR>') -- Comment selection
map('', '<C-N>', ':call NERDComment("n", "Uncomment")<CR>') -- Uncomment selection
-- vim-test
map('n', '<leader>tn', '<cmd>TestNearest<CR>', { noremap = true, silent = true}) -- Test nearest test
map('n', '<leader>tf', '<cmd>TestFile<CR>', { noremap = true, silent = true}) -- Test file
map('n', '<leader>ts', '<cmd>TestSuite<CR>', { noremap = true, silent = true}) -- Test suite
map('n', '<leader>tl', '<cmd>TestLast<CR>', { noremap = true, silent = true}) -- Test last test run
map('n', '<leader>tv', '<cmd>TestVisit<CR>', { noremap = true, silent = true}) -- Test visit
-- terminal
map('t',  '<Esc>', '<C-\\><C-n>') -- turn terminal to normal mode with escape
map('n', '<C-l>', '<cmd>lua open_terminal()<CR>') -- open terminal
-- search and replace
map('n', '<Leader>s',  ':%s//g<Left><Left>')
-- close buffer
map('n', '<leader>w', '<cmd>lua close_buffer()<CR>')
-- <Tab> to navigate the completion menu
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', {expr = true})
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
map('i', '<CR>', 'pumvisible() ? "\\<C-y>" : "\\<C-g>u\\<CR>"', {expr = true})
map('n', '<C-h>', '<cmd>noh<CR>')    -- Clear highlights
-- Delete vs cut --
map('n', 'd', '"_d')
map('v', 'd', '"_d')
map('n', '<leader>d', '"+d')
map('v', '<leader>d', '"+d')
map('n', 'D', '"_D')
map('n', '<leader>D', '"+D')
map('n', 'x', '"_x')
map('n', 'X', '"_X')
map('n', 'c', '"_c')
map('v', 'c', '"_c')

map('i', '<C-u>', '<C-g>u<C-u>')  -- Make <C-u> undoable
map('i', '<C-w>', '<C-g>u<C-w>')  -- Make <C-w> undoable

-------------------- TREE-SITTER ---------------------------
local ts = require 'nvim-treesitter.configs'
ts.setup {ensure_installed = 'maintained', highlight = {enable = true}}

-------------------- LSP -----------------------------------
local lsp = require 'lspconfig'
local lspfuzzy = require 'lspfuzzy'

lsp.tsserver.setup {}
lsp.elixirls.setup {}
-- lsp.ccls.setup {}
-- root_dir is where the LSP server will start: here at the project root otherwise in current folder
-- lsp.pyls.setup {root_dir = lsp.util.root_pattern('.git', fn.getcwd())}
lspfuzzy.setup {}  -- Make the LSP client use FZF instead of the quickfix list

map('n', '<space>lp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
map('n', '<space>ln', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
map('n', '<space>la', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', '<space>ld', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', '<space>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
map('n', '<space>lh', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<space>lm', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<space>lr', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<space>ls', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')

-------------------- COMMANDS ------------------------------
function open_terminal()
  cmd('split term://zsh')
  cmd('resize 10')
end

function close_buffer()
  if #fn.getbufinfo('')[1]['windows'] > 1 then cmd 'close'; return end
  local buflisted = fn.getbufinfo {buflisted = 1}
  local last_bufnr = buflisted[#buflisted]['bufnr']
  if fn.bufnr '' == last_bufnr then cmd 'bp' else cmd 'bn' end
  cmd 'bd #'
end

-- Highlight yanked text
cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'  -- disabled in visual mode
-- Use relative numbers in normal mode
cmd 'au InsertLeave * lua vim.wo[\'relativenumber\'] = true'
-- Use number in insert mode
cmd 'au InsertEnter * lua vim.wo[\'relativenumber\'] = false'
-- Open terminal buffer in insert mode
cmd 'au BufEnter * if &buftype == \'terminal\' | :startinsert | endif'
