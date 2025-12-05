inoremap jj <Esc>
set number
set autoindent
set smartindent
set clipboard=unnamedplus
set tabstop=4
set shiftwidth=4
set softtabstop=4

set expandtab

autocmd Filetype make setlocal noexpandtab
autocmd Filetype html setlocal noexpandtab
autocmd Filetype tex  setlocal spell spelllang=en_gb

call mkdir(expand("~/.vim/swap"), "p", 0700)
set dir=~/.vim/swap//

" Remove trailing spaces when saving
" autocmd BufWrite * :call Delete_trailing_spaces()

" Yank up to 1000 lines
set viminfo='100,<1000,s100,h

" For vimdiff
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

" For spellcheck
hi SpellBad ctermfg=015 ctermbg=009 cterm=bold guibg=#ff0000 guifg=#000000 gui=bold

set colorcolumn=81

syntax on
