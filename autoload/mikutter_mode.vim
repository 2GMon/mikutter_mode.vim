let s:rbfile = " " . expand('<sfile>:p:h') . "/mikutter_mode.rb "

function! mikutter_mode#onthefly_excuter_current_buffer()
  let lines = getline(0, line("$"))
  let code = substitute(join(lines, "\n"), '"', '\\"', 'g')
  call system('ruby ' . s:rbfile . '"' . code . '"')
endfunction
