if exists('g:loaded_zeal')
  finish
endif
let g:loaded_zeal = 1

command! -nargs=* Zeal call toolbox#zeal#open(<q-args>, '')
