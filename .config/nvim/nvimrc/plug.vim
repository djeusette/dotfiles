" ## Plugs
"
" We deal with our plugs first thing because later sections
" rely on them being available.
"
" # Vim Plug initialization

call plug#begin('~/.config/nvim/bundle')

" Place your Plugs here!
Plug 'elixir-lsp/elixir-ls', { 'do': { -> g:ElixirLS.compile() } }
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'Shougo/vimproc.vim', {'do' : 'make'}

Plug 'airblade/vim-gitgutter'

" fzf install via HomeBrew
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
" Plug 'tpope/vim-dispatch'

"Plug 'davidhalter/jedi-vim'

" Plug 'ludovicchabant/vim-gutentags'
Plug 'mhinz/vim-startify'

Plug 'neomake/neomake'

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

Plug 'sheerun/vim-polyglot'

Plug 'janko-m/vim-test'

" Colorschemes
Plug 'nanotech/jellybeans.vim'

Plug 'mattn/emmet-vim'
Plug 'easymotion/vim-easymotion'

call plug#end()
