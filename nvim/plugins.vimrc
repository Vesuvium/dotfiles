" Plugin settings

" Plug configuration
call plug#begin('~/.local/share/nvim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'octref/RootIgnore'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ryanoasis/vim-devicons'
Plug 'Townk/vim-autoclose'
Plug 'sickill/vim-pasta'
Plug 'yuttie/comfortable-motion.vim'
Plug 'tpope/vim-abolish'
Plug 'pbrisbin/vim-mkdir'
Plug 'reedes/vim-pencil'
Plug 'tpope/vim-surround'
Plug 'sirver/ultisnips'


" Languages support
Plug 'digitaltoad/vim-jade'
Plug 'elixir-lang/vim-elixir'
Plug 'avdgaag/vim-phoenix'
Plug 'kchmck/vim-coffee-script'
Plug 'plasticboy/vim-markdown'
Plug 'robbles/logstash.vim'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-cucumber'
Plug 'cespare/vim-toml'
Plug 'zah/nim.vim'
Plug 'hashivim/vim-terraform'

" Prose
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }

" Autocomplete plugins
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'

" Themes
Plug 'arcticicestudio/nord-vim'
Plug 'junegunn/seoul256.vim'
Plug 'mhinz/vim-janah'
Plug 'AlessandroYorba/Alduin'
Plug 'mhartington/oceanic-next'
Plug 'axvr/photon.vim'
Plug 'pgdouyon/vim-yin-yang'
Plug 'whatyouhide/vim-gotham'
Plug 'saltdotac/citylights.vim'


call plug#end()

" let g:limelight_conceal_ctermfg = 'gray'

let g:NERDTreeMinimalUI = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeRespectWildIgnore = 1

" autocmd VimEnter deoplete#initialize()
let g:deoplete#enable_at_startup = 1
