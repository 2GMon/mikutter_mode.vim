if exists('g:loaded_mikutter_mode')
    finish
endif
let g:loaded_mikutter_mode = 1

let s:snippets_directory = expand('<sfile>:p:h:h') . "/autoload/neosnippet/snipetts"
let s:current_snippets_direcotory = g:neosnippet#snippets_directory
let g:neosnippet#snippets_directory = s:current_snippets_direcotory . ',' . s:snippets_directory

augroup mikutter-setting
  autocmd!
  autocmd FileType ruby if match(expand("%:p"), 'mikutter') != -1 | set filetype=mikutter.ruby | endif
augroup END

command! MikutterModeOnTheFlyExcuterCurrentBuffer
            \ call mikutter_mode#onthefly_excuter_current_buffer()
