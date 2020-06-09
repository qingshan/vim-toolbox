function! toolbox#markdown#build_link(cursor)
  if a:cursor
    let url = toolbox#markdown#get_url()
    if url == ''
      return
    endif
    return toolbox#markdown#to_markdown(url)
  endif
  for n in range(a:firstline, a:lastline)
    call toolbox#markdown#cursor_to_url(n)
  endfor
endfunction

function! toolbox#markdown#get_url()
  let reg = @r
  execute 'normal "ryiu'
  let url = @r
  let @r = reg
  return url
endfunction

function! toolbox#markdown#get_page_title(url)
  if executable('curl')
    let cmd = 'curl -so - ' . shellescape(a:url) . '| grep -iPo ''(?<=<title>)(.*)(?=</title>)'''
    let title = trim(system(cmd))
    return title
  elseif executable('wget')
    let cmd = 'wget -qO - ' . shellescape(a:url) . '| grep -iPo ''(?<=<title>)(.*)(?=</title>)'''
    let title = trim(system(cmd))
    return title
  else
    throw 'require `curl` or `wget` command'
  endif
endfunction

function! toolbox#markdown#to_markdown(url)
  let title = toolbox#markdown#get_page_title(a:url)
  let reg = @r
  let @r = "[".title."](".a:url.")"
  execute 'normal viu"rP'
  let @r = reg
endfunction

function! toolbox#markdown#cursor_to_url(n)
  let l:colpos = toolbox#markdown#get_url_col_position(a:n)

  while l:colpos != -1
    call cursor(a:n, l:colpos)
    let url = toolbox#markdown#get_url()
    call toolbox#markdown#to_markdown(url)
    let l:colpos = toolbox#markdown#get_url_col_position(a:n)
  endwhile

endfunction

function! toolbox#markdown#get_url_col_position(n)
  let l:pos = match(getline(a:n), '\v([^([]|^)https?', 0)
  if l:pos > 0
    let l:pos += 1
  endif
  return l:pos
endfunction
