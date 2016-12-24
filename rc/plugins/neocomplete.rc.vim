let g:neocomplete#disable_auto_complete = 0
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_camel_case = 1
let g:neocomplete#auto_complete_delay = 30
let g:neocomplete#enable_fuzzy_completion = 1
let g:neocomplete#auto_completion_start_length = 2
let g:neocomplete#manual_completion_start_length = 0
let g:neocomplete#min_keyword_length = 3
let g:neocomplete#enable_auto_select = 1
let g:neocomplete#enable_auto_delimiter = 1
let g:neocomplete#max_list = 100

if !exists("g:neocomplete#sources#omni#input_patterns")
  let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:marching_enable_neocomplete = 1
let g:neocomplete#sources#omni#input_patterns.python = 
      \ "[^. *\t]\.\w*\|\h\w*"
let g:neocomplete#sources#omni#input_patterns.cpp = 
      \ "[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w::\w*"

