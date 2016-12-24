call deoplete#custom#set("_", "converters", [
      \ "converter_remove_paren",
      \ "converter_remove_overlap",
      \ "converter_truncate_abbr",
      \ "converter_truncate_menu",
      \ "converter_auto_delimiter",
      \ ])
call deoplete#custom#set("clang", "input_pattern", "\.\w*|\.->\w*|\w+::\w*")
call deoplete#custom#set("clang", "max_pattern_length", -1)

let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.python = ""
let g:deoplete#omni#functions = {}

let g:deoplete#enable_camel_case = 1
let g:deoplete#skip_chars = ["(", ")"]
