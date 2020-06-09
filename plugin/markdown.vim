command! MarkdownLink call toolbox#markdown#build_link(1)
command! -range MarkdownLink <line1>,<line2>call toolbox#markdown#build_link(0)
