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

" Languages support
Plug 'digitaltoad/vim-jade'
Plug 'elixir-lang/vim-elixir'
Plug 'kchmck/vim-coffee-script'
Plug 'plasticboy/vim-markdown'
Plug 'robbles/logstash.vim'
Plug 'rust-lang/rust.vim'

" Prose
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }

" Autocomplete plugins
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'

" Themes
Plug 'ajh17/spacegray.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'badacadabra/vim-archery'
Plug 'cseelus/vim-colors-tone'
Plug 'junegunn/seoul256.vim'
Plug 'mhinz/vim-janah'
Plug 'reedes/vim-colors-pencil'
Plug 'altercation/vim-colors-solarized'
Plug 'AlessandroYorba/Alduin'
Plug 'owickstrom/vim-colors-paramount'
Plug 'mhartington/oceanic-next'
Plug 'axvr/photon.vim'
Plug 'barretren/vim-colorscheme'
Plug 'pgdouyon/vim-yin-yang'
Plug 'abnt713/vim-hashpunk'
Plug 'smallwat3r/vim-hashpunk-sw'
Plug 'beikome/cosme.vim'
Plug 'cseelus/vim-colors-tone'
Plug 'nightsense/cosmic_latte'
Plug 'szorfein/fromthehell.vim'
Plug 'maksimr/Lucius2'


call plug#end()

" let g:limelight_conceal_ctermfg = 'gray'

let g:NERDTreeMinimalUI = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeRespectWildIgnore = 1

" autocmd VimEnter deoplete#initialize()
let g:deoplete#enable_at_startup = 1
