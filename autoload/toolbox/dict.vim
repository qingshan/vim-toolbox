function! toolbox#dict#get_word(mode)
  if a:mode == 'v'
    let l:pos = getpos("'<")
    call setpos('.', l:pos)
    return getline('.')[col("'<") - 1 : col("'>") - 1]
  else
    return expand('<cword>')
  endif
endfunction

function! toolbox#dict#stardict(word, mode) abort
  let word = a:word
  if word == ''
    let word = toolbox#dict#get_word(a:mode)
  endif
  let cmd = printf('sdcv -n -e %s', shellescape(word))
  let output = system(cmd)
  call popup_clear()
  call popup_atcursor(split(output, '\n'), {
    \ 'padding': [1, 1, 1, 1],
    \ 'borderchars': ['-','|','-','|','+','+','+','+'],
    \ 'border': [1, 1, 1, 1],
    \ })
endfunction

function! toolbox#dict#goldendict(word, mode) abort
  let word = a:word
  if word == ''
    let word = toolbox#dict#get_word(a:mode)
  endif
  let cmd = printf('goldendict %s', shellescape(word))
  call system(cmd)
endfunction
