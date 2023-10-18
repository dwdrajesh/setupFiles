
""" highlight search
set hlsearch
"""" to always show full path of current file
set statusline+=%F
""""""""""""""""""
" To open files in the same dir as the opened file currently
"set autochdir
nnoremap ,p "0p
" to fix backspace/delete not working in insert mode
:set backspace=indent,eol,start
""" smartcase for case-insensitive search"
:set ignorecase
:set smartcase
" for full filepath 
:set ruler
" for column number
:set statusline+=%F\ %l\:%c
"/copyright      " Case insensitive
"/Copyright      " Case sensitive
"/copyright\C    " Case sensitive
"/Copyright\c    " Case insensitive
""""""""""""""""""""""""""""""""""
" Disable these things to speed up vim diff
if &diff
    syntax off
    set undolevels=0
endif

" Exit vim git difftool with qq and while committing
if &diff
  map Q :cquit<CR>
endif
if &diff
  map q :qa<CR>
endif
"""""""""""""""""""""""""""""""""
" Exit vim git difftool with qq and while committing
" map <C-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
"if &diff
"     map <C-[> [c
"     map <C-]> ]c
"     map <C-Right> do 
"" do means diffget : put diff from left to right (do = diff obtain)
"" dp means diffput : put diff from right to left
"endif
""""""""""""""""""""""""""""""""
"set foldmethod=indent
" Fix the difficult-to-read default setting for diff text highlighting.  The
" bang (!) is required since we are overwriting the DiffText setting. The highlighting
" for "Todo" also looks nice (yellow) if you don't like the "MatchParen" colors.
highlight! link DiffText MatchParen
"if &diff
"    colorscheme jellybeans"railscasts "evening
"endif

" marker for 80 chars
"set colorcolumn=80
" colorscheme wombat
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" give location of tags file to vim: 
" this will search from current directory and up, up until $HOME for the file named 'tags'
set tags=./tags,tags;$HOME
" recreate tags file with F5
map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" ctag go to next tag, previous
" main mapping, go to first matching tag
map tt <c-]>
" move forward and back through matching tags
"map <c-b> :tprevious<CR>
"map <c-t> :tnext<CR>
" For opening tag in new horizontal split: Ctrl + W + Ctrl + ] : 
" Ctrl + \ : open tag in new tab (not needed)
" map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"map <leader><C-[> :sp <CR>:exec("tag ".expand("<cword>"))<CR>
" Alt + ] : open in new vertical split
map <C-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
"noremap <C-[> :only<bar>split<CR>:execute "tag" . expand('<cword>')<CR>
" close current split
"map <C-q> :q<CR>
" To open the current vertical split as horizontal (notice the capital 'H')
" :windo wincmd K (vertical to horizontal)
" :windo wincmd H (horizontal to vertical)
"noremap <c-w>/  <c-w>t<c-w>H
" vertical to horizontal ( | -> -- )
" noremap <c-w>-  <c-w>t<c-w>K
"  <C-w>r  to swap two windows if they are not in the good orde
" tabclose: 
map ct :tabclose <CR>
" go to next tab: gt or gT
" Open the split in new tab: Ctrl + w + T (capital T)
""""""""""""""""""""""""""""""""""""
" cscope close/open quickfix 
" let mapleader =","
map <C-n> : cn<CR>
map <C-m> : cp<CR>
" nnoremap <leader>q : cclose<CR>
nnoremap ,q : cclose<CR>
nnoremap ,c : copen<CR>
"cscope quickfix window close and open
"nmap <C-q> cclose 
" To open cscope in quickfix window automatically
set cscopequickfix=s-,c-,d-,i-,t-,e-
augroup qf
autocmd!
autocmd QuickFixCmdPost * cwindow
augroup END
""""""""""""""""""""""
" For CtrlP : Fuzzy file finder
set runtimepath^=~/.vim/bundle/ctrlp.vim
" Set root directory as the root directory of the project
noremap <C-a> :CtrlP /repo/`whoami`/radiosw <CR>
"""""
" OmnicppComplete
"call plug#begin('~/.vim')
"Plug 'https://github.com/vim-scripts/OmniCppComplete.git'
"call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""
" --- OmniCppComplete ---
"set tags+=~/.vim/commontags
" The below ~./vim/tags/cpp file was created manually and is needed for auto-completion to work for std:: library
"set tags+=~/.vim/tags/cpp
" -- required --
"set nocp " non vi compatible mode
"filetype plugin on " enable plugins
" -- optional --
" auto close options when exiting insert mode or moving away
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave *  if pumvisible() == 0|pclose|endif
"set completeopt=menu,menuone
" -- configs --
"let OmniCpp_MayCompleteDot   = 1 " autocomplete with .
"let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
"let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
"let OmniCpp_SelectFirstItem  = 1 " select first item inserted.
"let OmniCpp_NamespaceSearch  = 2 " search namespaces in this and included files
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e. parameters) in popup window
"let OmniCpp_LocalSearchDecl  = 1 " don't require special style of function opening braces
"let OmniCpp_DefaultNamespaces= ["std", "_GLIBCXX_STD", "_GLIBCXX_STD_A", "_GLIBCXX_STD_C"]
" -- ctags --  -- proj.vim
" map <ctrl>+F12 to generate ctags for current folder:
"map <C-x><C-t> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
" add current directory's generated tags file to available tags
set tags+=./tags;
set tags+=~/bin/cpp_tags
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indentation: 
" use intelligent indentation for C
" the preferred method now is NOT to use smartindent, but instead use next 2 lines
" but Cisco PRRQ needs autoindent?
"set smartindent
"set autoindent
"filetype plugin indent on
set tabstop=8        " show existing tab with 8 spaces width
set softtabstop=4 " set tabstop=8 and softabstop=4 will give you exactly as PRRQ tool sees

set shiftwidth=4     " indent with '>' also with 4 spaces
set expandtab        " on pressing tab, don't add tab characters when tab is pressed

" Be smart when using tabs :) i.e. when Tab is pressed, indent as per
" 'shiftwidth' at the beginning of the line
set smarttab
" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
autocmd bufreadpre *.c setlocal textwidth=80
autocmd bufreadpre *.h setlocal textwidth=80
autocmd bufreadpre *.cc setlocal textwidth=80
" turn syntax highlighting on
set t_Co=256
syntax on
set term=xterm-256color

"""""""""" Cisco indentation """"""""
set wildchar=^I
set wildmenu
set nohlsearch
set autoindent

set shiftwidth=4
set shiftround
set incsearch
set tabstop=8
set softtabstop=4
set laststatus=2
set expandtab
set whichwrap=h>,b,s
set formatoptions=q
""""""""""Cisco indentation End """"""""
""""""""""""""""""""""""""""""""""""""""
" to let vim know where to look for cscope DB
" cs add $CSCOPE_DB
"set csprg=/usr/bin/cscope
"set csprg=/router/bin/cscope
"cs add $CSCOPE_DB
"exe "cs add /repo/ezdawra/radiosw/files.cs.txt"
" cscope copied from cisco:
" https://wiki.cisco.com/display/FABRIC1T/Productivity+Boosters?preview=%2F33483508%2F33483510%2FVim%2C+cscope+and+ctags.pdf"
"
"if has("cscope") && filereadable("/router/bin/cscope")
"    set csprg=/router/bin/cscope
"elseif has("cscope") && filereadable("/auto/andatcd/cscope/15.5/bin/cscope")
"    set csprg=/auto/andatcd/cscope/15.5/bin/cscope
"endif

"if has("cscope") && filereadable("/auto/andatcd/cscope/15.5/bin/cscope")
"    set csprg=/auto/andatcd/cscope/15.5/bin/cscope
"endif
"if has("cscope") && filereadable("/router/bin/cscope")
"    set cscopeprg=/router/bin/cscope
"endif

if has("cscope")
    set csto=0
    set cst
    set nocsverb
" add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
" else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag
"   's'   symbol: find all references to the token under cursor
""   'g'   global: find global definition(s) of the token under cursor
""   'c'   calls:  find all calls to the function name under cursor
""   't'   text:   find all instances of the text under cursor
""   'e'   egrep:  egrep search for the word under cursor
""   'f'   file:   open the filename under cursor
""   'i'   includes: find files that include the filename under cursor
""   'd'   called: find functions that function under cursor calls
    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>	
    " Hitting CTRL-space *twice* before the search type does a vertical 
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left
    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    set notimeout 
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    "set timeoutlen=4000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
    " delays as vim waits for a keystroke after you hit ESC (it will be
    " waiting to see if the ESC is actually part of a key code like <F1>).
    "
    "set ttimeout 
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or network
    " connection, set it higher.  If you don't set ttimeoutlen, the value for
    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
    "
    "set ttimeoutlen=100
endif
"
" cscope from Ethan
"""""""""""""""""""""""""""""""""""""""""""""
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  " else add the database pointed to by environment variable 
  elseif $CSCOPE_DB != "" 
    cs add $CSCOPE_DB
  endif
endfunction
au BufEnter /* call LoadCscope()
""""""""""""""""""""""""""""""""""""""""""""""""""
" To hide the duplicate cscope database warning
set nocscopeverbose 
:set number
"set mouse=a
nmap <C-j>  <C-W>j
nmap <C-k>  <C-W>k
nmap <C-h>  <C-W>h
nmap <C-l>  <C-W>l
"""""""""""""""""""""""""""""""
""""""""""""""""""""""
nnoremap <S-left> :vertical resize -5<cr>
nnoremap <S-down> :resize +5<cr>
nnoremap <S-up> :resize -5<cr>
nnoremap <S-right> :vertical resize +5<cr>
""""""""""""""""""""""
"let Tlist_Auto_Open = 1
    """""""""""""""""""""""""""""""""""""""""
" Newly added on 27 Sept, for recursive grep:
" http://chase-seibert.github.io/blog/2013/09/21/vim-grep-under-cursor.html
" redraw! at last is added to redraw screen from blank screen
" command! -nargs=+ Grep execute 'silent grep! -I -r -n --include *.{c,cc,h} --exclude *.{o,P} --exclude tags . -e <args>' | copen | execute 'silent /<args>' | redraw!
command! -nargs=+ Grep execute 'silent grep! -I -r -n --exclude *.{o} --exclude tags . -e <args>' | copen | execute 'silent /<args>'
" shift-control-* Greps for the word under the cursor
nmap ,g :Grep <c-r>=expand("<cword>")<cr><cr>
"nmap <F3> :vimgrep  /\<<C-R>=expand("<cword>")<CR>\>/ %<CR>:cl<CR>
"nmap <Space> <C-F>


