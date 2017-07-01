" Plugin settings

" Plug configuration
call plug#begin('~/.local/share/nvim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator' 
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }

" Autocomplete plugins
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'

" Themes
Plug 'junegunn/seoul256.vim'
Plug 'arcticicestudio/nord-vim'

call plug#end()

" let g:limelight_conceal_ctermfg = 'gray'

let g:NERDTreeMinimalUI = 1
let g:NERDTreeChDirMode = 2

" autocmd VimEnter deoplete#initialize()
" let g:deoplete#enable_at_startup = 1
