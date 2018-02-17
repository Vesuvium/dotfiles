" Plugin settings

" Plug configuration
call plug#begin('~/.local/share/nvim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ryanoasis/vim-devicons'
Plug 'Townk/vim-autoclose'
Plug 'sickill/vim-pasta'
Plug 'yuttie/comfortable-motion.vim'
Plug 'tpope/vim-abolish'

" Languages support
Plug 'kchmck/vim-coffee-script'
Plug 'elixir-lang/vim-elixir'
Plug 'plasticboy/vim-markdown'
Plug 'robbles/logstash.vim'
Plug 'digitaltoad/vim-jade'

" Prose
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }

" Autocomplete plugins
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'

" Themes
Plug 'junegunn/seoul256.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'preocanin/greenwint'
Plug 'mhinz/vim-janah'

call plug#end()

" let g:limelight_conceal_ctermfg = 'gray'

let g:NERDTreeMinimalUI = 1
let g:NERDTreeChDirMode = 2

" autocmd VimEnter deoplete#initialize()
let g:deoplete#enable_at_startup = 1
