" Search:
set ignorecase
set smartcase
set incsearch
set nohlsearch
set wrapscan

" Edit:
set smarttab
set expandtab
set shiftround
set shiftwidth=4
set autoindent smartindent
set modelines=0
set nomodeline
if (!has("nvim") || $DISPLAY != "") && has("clipboard")
  if has("unnamedplus")
    set clipboard& clipboard+=unnamedplus
  else
    set clipboard& clipboard+=unnamed
  endif
endif
set backspace=indent,eol,start
set matchpairs+=<:>
set hidden
set foldenable
set foldmethod=marker
set foldcolumn=1
set fillchars=vert:\|
set commentstring=%s
if exists("*FoldCCtext")
  set foldtext=FoldCCtext()
endif
set grepprg=grep\ -inH
set isfname-==
set timeout timeoutlen=3000 ttimeoutlen=100
set updatetime=1000
set directory-=.
set undofile
let &g:undodir = &directory
set virtualedit=block
set keywordprg=:help
autocmd MyAutoCmd WinEnter * checktime
autocmd MyAutoCmd InsertLeave *
      \ if &paste | setlocal nopaste | echo "nopaste" | endif |
      \ if &l:diff | diffupdate | endif
autocmd MyAutoCmd BufWritePre *
      \ call s:mkdir_as_necessary(expand("<afile>:p:h"), v:cmdbang)
function! s:mkdir_as_necessary(dir, force) abort
  if !isdirectory(a:dir) && &l:buftype == "" &&
        \ (a:force || input(printf('"%s" does not exist. Create? [y/N]',
        \              a:dir)) =~? "^y\%[es]$")
    call mkdir(iconv(a:dir, &encoding, &termencoding), "p")
  endif
endfunction
set formatexpr=autofmt#japanese#formatexpr()
set helplang& helplang=en,ja
let t:cwd = getcwd()

" View:
set number
set list
set listchars=tab:▸\ ,trail:-,extends:»,precedes:«,nbsp:%
set laststatus=2
set noshowcmd
set title
set titlelen=95
set titlestring="
      \ %{expand('%:p:~:.')}%(%m%r%w%)
      \ %<\(%{WidthPart(
      \ fnamemodify(&filetype ==# 'vimfiler' ?
      \ substitute(b:vimfiler.current_dir, '.\\zs/$', '', '') : getcwd(), ':~'),
      \ &columns-len(expand('%:p:.:~')))}\) - VIM"
set showtabline=0
let &g:statusline="%{winnr('$')>1?'['.winnr().'/'.winnr('$')"
      \ . ".(winnr('#')==winnr()?'#':'').']':''}\ "
      \ . "%{(&previewwindow?'[preview] ':'').expand('%:t')}"
      \ . "\ %=%{(winnr('$')==1 || winnr('#')!=winnr()) ?
      \ '['.(&filetype!=''?&filetype.',':'')"
      \ . ".(&fenc!=''?&fenc:&enc).','.&ff.']' : ''}"
      \ . "%m%{printf('%'.(len(line('$'))+2).'d/%d',line('.'),line('$'))}"
set whichwrap+=h,l,<,>,[,],b,s,~
set nowrap
set shortmess=aTI
set noshowmode
if has("patch-7.4.314")
  set shortmess+=c
else
  autocmd MyAutoCmd VimEnter *
        \ highlight ModeMsg guifg=bg guibg=bg |
        \ highlight Question guifg=bg guibg=bg
endif
if has("pathc-7.4.1570")
  set shortmess+=F
endif
set nowritebackup
set nobackup
set noswapfile
set backupdir-=.
set t_vb=
set novisualbell
set belloff=all
set nowildmenu
set wildmode=list:longest,full
set history=1000
set showfulltag
set wildoptions=tagfile
if has("nvim")
  set shada=!,'300,<50,s10,h
else
  set viminfo=!,'300,<50,s10,h
endif
let g:did_install_default_menus = 1
set completeopt=menuone
if has("patch-7.4.775")
  set completeopt+=noinsert
endif
set complete=.
set pumheight=20
set report=0
set nostartofline
set splitbelow
set splitright
set winwidth=30
set winheight=1
set cmdwinheight=5
set noequalalways
set previewheight=8
set helpheight=12
set ttyfast
set display=lastline

function! WidthPart(str, width) abort "{{{
  if a:width <= 0
    return ""
  endif
  let ret = a:str
  let width = strwidth(a:str)
  while width < a:width
    let char = matchstr(ret, ".$")
    let ret = ret[: -1 - len(char)]
    let width -= strwidth(char)
  endwhile
  return ret
endfunction"}}}

set conceallevel=2 concealcursor=niv
