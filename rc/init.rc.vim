language message C

let g:mapleader = ","
let g:maplocalleader = "m"

nnoremap ; <Nop>
nnoremap m <Nop>
nnoremap , <Nop>

let $CACHE = expand("~/.cache")

if !isdirectory($CACHE)
  call mkdir($CACHE, "p")
endif

if filereadable(expand("~/.local_vimrc"))
  execute "source" expand("~/.local_vimrc")
endif

let s:dein_dir = finddir("dein.vim", ".;")
if s:dein_dir != "" || &runtimepath !~ "/dein.vim"
  if s:dein_dir == "" && &runtimepath != "/dein.vim"
    let s:dein_dir = expand("$CACHE/dein")
          \. "/repos/github.com/Shougo/dein.vim"
    if !isdirectory(s:dein_dir)
      execute "!git clone https://github.com/Shougo/dein.vim" s:dein_dir
    endif
  endif
  execute "set runtimepath^=" . substitute(
        \ fnamemodify(s:dein_dir, ":p") , "/$", "", "")
endif

set packpath=

let g:loaded_2html_plugin = 1
let g:loaded_logiPat = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_gzip = 1
let g:loaded_man = 1
let g:loaded_matchit = 1
let g:loaded_matchparen = 1
let g:loaded_netrwFileHandlers = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_rrhelper = 1
let g:loaded_shada_plugin = 1
let g:loaded_spellfile_plugin = 1
let g:loaded_tarPlugin = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_vimballPlugin = 1
let g:loaded_zipPlugin = 1
