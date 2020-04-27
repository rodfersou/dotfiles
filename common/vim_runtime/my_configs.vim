"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General fixes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nofoldenable    " disable folding
set encoding=UTF-8
set number
set autoread
set clipboard=unnamedplus


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fix Alt (Meta)
" https://stackoverflow.com/a/10216459
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw
set timeout ttimeoutlen=50
" set ttimeout ttimeoutlen=50


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom macros
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let @s='msgg/^fromV)k;sort i/^importV)k;sort i`s;noh'
let @d='oimport pdb; pdb.set_trace()import ipdb; ipdb.set_trace()import debug'
let @u='ofrom Products.CMFPlone.utils import safe_unicode'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitright
set splitbelow

let g:NERDTreeChDirMode=0
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeMouseMode=2
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let NERDTreeKeepTreeInNewTab=1
let NERDTreeQuitOnOpen=1
function! s:CloseIfOnlyControlWinLeft()
  if winnr("$") != 1
    return
  endif
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
        \ || &buftype == 'quickfix'
    q
  endif
endfunction
augroup CloseIfOnlyControlWinLeft
  au!
  au BufEnter * call s:CloseIfOnlyControlWinLeft()
augroup END
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
if has('gui_running')
  " Open by mouse click
  noremap <F12> :NERDTreeToggle %<CR>
else
  noremap <F12> :NERDTreeToggle<CR>
endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set selection=inclusive
let g:multi_cursor_start_word_key      = '<C-d>'
let g:multi_cursor_select_all_word_key = '<A-d>'
let g:multi_cursor_start_key           = 'g<C-d>'
let g:multi_cursor_select_all_key      = 'g<A-d>'
let g:multi_cursor_next_key            = '<C-d>'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Use ; as :
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap ; :
" noremap : ;


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Easy save
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap ss :wa<cr>
nnoremap SS :xa<cr>
nnoremap zz :x<cr>
nnoremap ZZ :qa!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fix tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4
set shiftwidth=4
set expandtab
autocmd BufWrite * :retab
