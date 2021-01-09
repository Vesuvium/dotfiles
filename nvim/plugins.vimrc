" Plugin settings

" Plug configuration
call plug#begin('~/.local/share/nvim/plugged')

Plug 'Townk/vim-autoclose'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'itchyny/lightline.vim'
Plug 'octref/RootIgnore'
Plug 'pbrisbin/vim-mkdir'
Plug 'reedes/vim-pencil'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'sickill/vim-pasta'
Plug 'sirver/ultisnips'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'yuttie/comfortable-motion.vim'


" Languages support
Plug 'avdgaag/vim-phoenix'
Plug 'cespare/vim-toml'
Plug 'digitaltoad/vim-jade'
Plug 'elixir-lang/vim-elixir'
Plug 'hashivim/vim-terraform'
Plug 'kchmck/vim-coffee-script'
Plug 'plasticboy/vim-markdown'
Plug 'robbles/logstash.vim'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-cucumber'
Plug 'zah/nim.vim'

" Prose
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'junegunn/limelight.vim'

" Autocomplete plugins
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'

" Themes
Plug 'AlessandroYorba/Alduin'
Plug 'arcticicestudio/nord-vim'
Plug 'axvr/photon.vim'
Plug 'junegunn/seoul256.vim'
Plug 'mhartington/oceanic-next'
Plug 'mhinz/vim-janah'
Plug 'pgdouyon/vim-yin-yang'
Plug 'saltdotac/citylights.vim'
Plug 'whatyouhide/vim-gotham'


call plug#end()

" let g:limelight_conceal_ctermfg = 'gray'

let g:NERDTreeMinimalUI = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeRespectWildIgnore = 1

" autocmd VimEnter deoplete#initialize()
let g:deoplete#enable_at_startup = 1
