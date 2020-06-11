if exists('g:loaded_dict')
  finish
endif
let g:loaded_dict = 1

command! -nargs=* StarDict call toolbox#dict#stardict(<q-args>, '')
command! -nargs=* GoldenDict call toolbox#dict#goldendict(<q-args>, '')
