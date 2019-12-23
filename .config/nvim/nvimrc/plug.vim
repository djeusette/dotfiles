" ## Plugs
"
" We deal with our plugs first thing because later sections
" rely on them being available.
"
" # Vim Plug initialization

call plug#begin('~/.config/nvim/bundle')

" Place your Plugs here!

Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" Plug 'Shougo/denite.nvim'

Plug 'gregsexton/gitv', {'on': ['Gitv']}
Plug 'airblade/vim-gitgutter'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-dispatch'

if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

"Plug 'davidhalter/jedi-vim'

Plug 'ludovicchabant/vim-gutentags'
Plug 'mhinz/vim-startify'

" Do not use with coc.nvim!
" Deoplete setup
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'wokalski/autocomplete-flow'
"Plug 'Shougo/neosnippet.vim'
"Plug 'Shougo/neosnippet-snippets'

" CoC setup
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'neomake/neomake'

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

Plug 'sheerun/vim-polyglot'

Plug 'janko-m/vim-test'

" Colorschemes
Plug 'nanotech/jellybeans.vim'

call plug#end()
