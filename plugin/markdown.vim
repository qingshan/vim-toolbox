if exists('g:loaded_markdown_link')
  finish
endif
let g:loaded_markdown_link = 1

command! MarkdownLink call toolbox#markdown#build_link(1)
command! -range MarkdownLink <line1>,<line2>call toolbox#markdown#build_link(0)
