" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')
cd Desktop
imap jj <Esc>			" mapping jj to instead of the escape key 
" Declare the list of plugins.
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()
"basic shit
set lines=50 columns=1000
syntax on				"enable syntax highlighting
set number				"enable line numbering
set cursorline				"enable line indicator
colorscheme sublimemonokai			"enable vim-code-dark theme
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1
map ; :NERDTreeToggle<CR>		"mapping ';' to toggle nerdtree
map , <C-w><C-w>			"mapping ',' to switch between windows
set breakindent				"smart word wrap
set linebreak				"not cut words in half in end of line
set shiftwidth=4
set tabstop=4
"indent lines
function! InsertTabWrapper()
      let col = col('.') - 1
      if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
      else
        return "\<c-p>"
      endif
    endfunction
    inoremap <tab> <c-r>=InsertTabWrapper()<cr>
"closing window if only nerdtree is left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"different highlighting for different extensions
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
"airline smart tab
let g:airline#extensions#tabline#enabled = 1
let g:sublimemonokai_term_italic = 1
let g:airline_powerline_fonts = 1
