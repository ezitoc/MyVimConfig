"This is my personal Vim Configuration.
"
"                           Ezequiel C.
"
"
"
"""""""""
"GENERAL"
"""""""""

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Enable syntax hl
"syntax enable
syntax on
let python_highlight_all = 1

" With a map leader it's possible to do extra key combinations like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Better copy & paste
"set clipboard=unnamed

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

" Mouse
set mouse=a

" Para GeMS
"au BufRead,BufNewFile *.gms set filetype=gems
"au! Syntax gems source $HOME/.vim/syntax/gems.vim
"au BufRead,BufNewFile *.gms colorscheme desert
"au BufRead,BufNewFile *.gms set syntax=gems

" Fast saving
nmap <leader>w :w!<cr>

" Fast editing of the .vimrc
map <leader>e :e! ~/.vimrc<cr>

" Sets how many lines of history VIM has to remember
set history=700

" Map sort function to a key
vnoremap <Leader>s :sort<CR>

" Easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

"highlight ColorColumn ctermbg=DarkGray
set colorcolumn=80

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Colors and fonts
set t_Co=256
colorscheme koehler
"colorscheme adaryn
"colorscheme zenburn
set background=dark
set nonumber
set encoding=utf8

" Use jk as <Esc> alternative
inoremap jk <Esc>

" Setup Pathogen to manage your plugins
call pathogen#infect()
call pathogen#helptags() " generate helptags for everything in 'runtimepath'

set term=xterm-256color

set nowrap

" Turn on WiLd menu
"set wildmenu

" Always show current position
set ruler

" Folding
"set foldmethod=syntax
"set foldlevelstart=1

let fortran_fold=1         " fortran
"let python_fold=1         " python
"set foldnestmax=2

" Alt + Arrow Navigation in INSERT mode
imap <silent> <A-Up> <ESC> :wincmd k<CR>i
imap <silent> <A-Down> <ESC> :wincmd j<CR>i
imap <silent> <A-Left> <ESC> :wincmd h<CR>i
imap <silent> <A-Right> <ESC> :wincmd l<CR>i

" Fortran free source
let fortran_free_source=1



filetype on
filetype plugin indent on

" Paste Toogle
set pastetoggle=<F10>

" Buffer explorer con F4
"map <f4> <leader>be

"NERDtree
map <F6> :NERDTreeToggle<CR>
" NERDtree at start Up
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
"let g:NERDTreeWinPos = "right"
" Quit NERDtree if it is the last Buffer
"function! NERDTreeQuit()
  "redir => buffersoutput
  "silent buffers
  "redir END
""                     1BufNo  2Mods.     3File           4LineNo
  "let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  "let windowfound = 0

  "for bline in split(buffersoutput, "\n")
    "let m = matchlist(bline, pattern)

    "if (len(m) > 0)
      "if (m[2] =~ '..a..')
        "let windowfound = 1
      "endif
    "endif
  "endfor

  "if (!windowfound)
    "quitall
  "endif
"endfunction
"autocmd WinEnter * call NERDTreeQuit()

autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

" SpellCheck:
map <F8> :setlocal spell! spelllang=es<CR>


"=========================================================================
"Vim-Latex Suite
"=========================================================================

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

"=========================================================================
"Python IDE
"=========================================================================

" Settings for vim-powerline
set laststatus=2

" Settings for CtrlP
"set runtimepath^=~/.vim/bundle/ctrlp.vim
"let g:ctrlp_max_height = 30
"set wildignore+=*.pyc
"set wildignore+=*_build/*
"set wildignore+=*/coverage/*

" Settings for Python-mode
map <Leader>g :call RopeGotoDefinition()<CR>
let g:pymode_rope_guess_project = 0
let g:pymode_virtualenv = 0
let g:pymode_rope = 1
let g:pymode_lint = 1
let g:pymode_lint_checker = "pep8"
let g:pymode_lint_ignore = "E501"
let g:pymode_run = 1
let g:pymode_doc = 1
let ropevim_enable_shortcuts = 1
"let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_vim_completion = 1
let g:pymode_rope_extended_complete = 1
"let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
"let g:pymode_breakpoint_cmd = "raise Exception('BREAKPOINT')"
"let g:pymode_syntax_builtin_objs = 0
"let g:pymode_syntax_builtin_funcs = 0
"map <Leader>b oraise Exception<C-c>
"map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"set completeopt=longest,menuone
"function! OmniPopup(action)
    "if pumvisible()
	"if a:action == 'j'
	    "return "\<C-N>"
	"elseif a:action == 'k'
	    "return "\<C-P>"
	"endif
    "endif
    "return a:action
"endfunction

"inoremap <silent>j <C-R>=OmniPopup('j')<CR>
"inoremap <silent>k <C-R>=OmniPopup('k')<CR>

" Python folding
"set nofoldenable

"""""""""
"HEADERS"
"""""""""

autocmd bufnewfile *.py so /home/ezequiel/.vim/template/python_header.txt
"autocmd bufnewfile *.tex so /home/ezequiel/.vim/template/latex_header.txt
"autocmd bufnewfile *.{py,tex} exe "1," . 15 . "g/File Name :.*/s//File Name : " .expand("%")
"autocmd bufnewfile *.{py,tex} exe "1," . 15 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
"autocmd Bufwritepre,filewritepre *.{py,tex} execute "normal ma"
"autocmd Bufwritepre,filewritepre *.{py,tex} exe "1," . 15 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")
"autocmd bufwritepost,filewritepost *.{py,tex} execute "normal `a"

" Quick mapping to put \(\) in your pattern string
cmap ;\ \(\)<Left><Left>

" Adding IMAPS from latex-suite to all files
augroup MyIMAPs
    au!
    au VimEnter * call IMAP('()', '(<++>)<++>', '')
    au VimEnter * call IMAP('[]', '[<++>]<++>', '')
    au VimEnter * call IMAP('{}', '{<++>}<++>', '')
    au VimEnter * call IMAP("''", "'<++>'<++>", '')
    au VimEnter * call IMAP('""', '"<++>"<++>', '')
augroup END

" Some nice colors for Pmenu
hi PmenuSel term=None cterm=None ctermfg=White ctermbg=DarkGreen
hi Pmenu term=None cterm=None ctermfg=White ctermbg=DarkBlue
hi LineNr ctermfg=green
hi TabLine ctermfg=white ctermbg=blue
hi TabLineSel term=None cterm=None ctermfg=White ctermbg=DarkGreen
hi TabLineFill ctermfg=white ctermbg=blue
hi Directory ctermfg=cyan
