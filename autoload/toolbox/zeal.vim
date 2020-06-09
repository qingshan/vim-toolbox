function! toolbox#zeal#get_word(mode) abort
  if a:mode == 'v'
    let l:pos = getpos("'<")
    call setpos('.', l:pos)
    return getline('.')[col("'<") - 1 : col("'>") - 1]
  else
    return expand('<cword>')
  endif
endfunction

function! toolbox#zeal#open(word, mode)
  let cmd = 'zeal '
  let word = a:word
  if word == ''
    let word = toolbox#zeal#get_word(a:mode)
  endif
  call system(cmd . word)
endfunction
