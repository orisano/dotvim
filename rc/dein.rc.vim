let g:dein#install_progress_type = "title"
let g:dein#install_message_type = "none"
let g:dein#enable_notification = 1

let s:path = expand("$CACHE/dein")
if !dein#load_state(s:path)
  finish
endif

call dein#begin(s:path, expand("<sfile>"))

call dein#load_toml("~/.vim/rc/dein.toml", {"lazy": 0})
call dein#load_toml("~/.vim/rc/deinlazy.toml", {"lazy": 1})
if has("nvim")
  call dein#load_toml("~/.vim/rc/deineo.toml", {})
endif

if dein#tap("deoplete.nvim") && has("nvim")
  call dein#disable("neocomplete.vim")
endif

call dein#end()
call dein#save_state()

if !has("vim_starting") && dein#check_install()
  call dein#install()
endif
