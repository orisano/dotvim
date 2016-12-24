nnoremap ! :<C-u>terminal<Space>

let s:num = 0
for s:color in [
      \ "#6c6c6c", "#ff6666", "#66ff66", "#ffd30a",
      \ "#1e95fd", "#ff13ff", "#1bc8c8", "#c0c0c0",
      \ "#383838", "#ff4444", "#44ff44", "#ffb30a",
      \ "#6699ff", "#f820ff", "#4ae2e2", "#ffffff",
      \ ]
  let g:terminal_color_{s:num} = s:color
  let s:num += 1
endfor

" let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
if exists("&inccommand")
  set inccommand=nosplit
endif
if has("vim_starting")
  syntax off
endif

autocmd MyAutoCmd CursorHold * if exists(":rshada") | rshada | wshada | endif
