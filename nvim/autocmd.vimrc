" Autocommands settings

" Goyo autocmd group
"
" Launches Goyo+Limelight when a markdown file is opened
augroup goyocustom
    autocmd!
    autocmd User GoyoEnter :colorscheme seoul256
    autocmd User GoyoEnter Limelight
    autocmd User GoyoLeave Limelight!
    " autocmd User GoyoLeave :colorscheme 
    " It seems autostarting goyo is troublesome
    "
    " autocmd Filetype markdown :Goyo
augroup end

" NERDtree autocmd group
"
" Automatically open NERDTree
augroup nerdtreecustom
    autocmd!
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup end
