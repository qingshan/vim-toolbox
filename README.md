# vim-toolbox
vim toolbox plugin: StarDict, GoldenDict, Zeal, Markdown

## StarDict

```
nmap <silent> gk :call toolbox#dict#stardict('', '')<CR>
vmap <silent> gk :call toolbox#dict#stardict('', 'v')<CR>
```

## GoldenDict

```
nmap <silent> gK :call toolbox#dict#goldendict('', '')<CR>
vmap <silent> gK :call toolbox#dict#goldendict('', 'v')<CR>
```

## Markdown

```
augroup markdown-link
  autocmd!
  autocmd FileType markdown nmap <silent> <Leader>ml :MarkdownLink<CR>
  autocmd FileType markdown vmap <silent> <Leader>ml :MarkdownLink<CR>
augroup END
```
