# vim-toolbox

vim toolbox plugin: StarDict, GoldenDict, Zeal, Markdown

## Installation

```vim
Plug 'qingshan/vim-toolbox'
```

## StarDict

```vim
nmap <silent> gk :call toolbox#dict#stardict('', '')<CR>
vmap <silent> gk :call toolbox#dict#stardict('', 'v')<CR>
```

## GoldenDict

```vim
nmap <silent> gK :call toolbox#dict#goldendict('', '')<CR>
vmap <silent> gK :call toolbox#dict#goldendict('', 'v')<CR>
```

## Zeal

```vim
nmap <silent> gz :call toolbox#zeal#open('', '')<CR>
vmap <silent> gz :call toolbox#zeal#open('', 'v')<CR>
```

## Markdown

```vim
augroup markdown-link
  autocmd!
  autocmd FileType markdown nmap <silent> <Leader>ml :MarkdownLink<CR>
  autocmd FileType markdown vmap <silent> <Leader>ml :MarkdownLink<CR>
augroup END
```
