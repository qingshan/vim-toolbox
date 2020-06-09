function! toolbox#dict#get_word(mode) abort
  if a:mode == 'v'
    let l:pos = getpos("'<")
    call setpos('.', l:pos)
    return getline('.')[col("'<") - 1 : col("'>") - 1]
  else
    return expand('<cword>')
  endif
endfunction

function! toolbox#dict#stardict(word, mode)
  let cmd = 'sdcv -n -e '
  let word = a:word
  if word == ''
    let word = toolbox#dict#get_word(a:mode)
  endif
  let output = system(cmd . word)
  call popup_clear()
  call popup_atcursor(split(output, '\n'), {
    \ 'padding': [1, 1, 1, 1],
    \ 'borderchars': ['-','|','-','|','+','+','+','+'],
    \ 'border': [1, 1, 1, 1],
    \ })
endfunction

function! toolbox#dict#goldendict(word, mode)
  let cmd = 'goldendict '
  let word = a:word
  if word == ''
    let word = toolbox#dict#get_word(a:mode)
  endif
  call system(cmd . word)
endfunction
