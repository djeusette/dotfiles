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

local function nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    vim.api.nvim_command('augroup '..group_name)
    vim.api.nvim_command('autocmd!')
      for _, def in ipairs(definition) do
        local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
        vim.api.nvim_command(command)
      end
    vim.api.nvim_command('augroup END')
  end
end

-------------------- Variables -------------------------------

cmd('filetype plugin indent on')

-- Define the leader as SPACE
g.mapleader = ' '

g.syntax_on = true

-- Disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

local indent = 2
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
-- opt('o', 'switchbuf', 'useopen')           -- Switch buffers
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
opt('o', 'hidden', true)                  -- Enable or disabled modified buffers in background
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
-- undofile
opt('o', 'undofile', true)
-- opt('o', 'undodir', '~/.config/nvim/undos') -- the directory interpolation does not work
opt('o', 'undolevels', 1000)
opt('o', 'undoreload', 10000)
-- Set completeopt to have a better completion experience
opt('o', 'completeopt', 'menuone,noinsert,noselect')
-- Avoid showing message extra message when using completion
cmd('set shortmess+=c')

-------------------- AUTOCMDS -------------------------------

-- Highlight yanked text
cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'  -- disabled in visual mode
-- Use relative numbers in normal mode
cmd 'au InsertLeave * lua vim.wo[\'relativenumber\'] = true'
-- Use number in insert mode
cmd 'au InsertEnter * lua vim.wo[\'relativenumber\'] = false'
-- Open terminal buffer in insert mode
cmd 'au BufEnter * if &buftype == \'terminal\' | :startinsert | endif'

nvim_create_augroups({
  RemoveTrailingWhitespaces = {
    {"BufWritePre", "*", [[:%s/\s\+$//e]]};
  },
  Format = {
    {"BufWritePre", "*", [[lua vim.lsp.buf.formatting_sync(nil, 2000)]]};
  }
})
