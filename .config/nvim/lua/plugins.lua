local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
        execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end

vim.cmd('packadd packer.nvim')

vim.cmd [[ autocmd BufWritePost plugins.lua PackerCompile ]]

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  use {
    'neoclide/coc.nvim', branch = 'release', config = require'plugins.coc'
  }

  use {'scrooloose/nerdcommenter', config = require('plugins.nerdcommenter') }

  -- Lazy loading:
  -- Load on specific commands
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  use {'tpope/vim-fugitive'}
  use {'airblade/vim-gitgutter'}
  use {'vim-test/vim-test', config = require('plugins.vim-test')}

  use {
    'lambdalisue/fern.vim',
    config = require('plugins.fern'),
    requires = {{'antoinemadec/FixCursorHold.nvim'}}
  }
  use {'lambdalisue/fern-git-status.vim'}

  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = require('plugins.nvim-treesitter') }

  use {'ctrlpvim/ctrlp.vim', config = require('plugins.ctrlp')}

  use {'junegunn/fzf', run = fn['fzf#install']}
  use {'junegunn/fzf.vim', config = require('plugins.fzf') }

  use {'NLKNguyen/papercolor-theme', config = require('plugins.papercolor') }

  use {'tjdevries/express_line.nvim', requires = {{'nvim-lua/plenary.nvim'}}, config = require('plugins.express_line') }

  use {'tpope/vim-projectionist'}
  use {'elixir-editors/vim-elixir'}

  use {'neomake/neomake', config = function() require('plugins.neomake') end}
end)


