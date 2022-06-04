augroup omnifuncs
  autocmd!
  autocmd BufNew,BufNewFile,BufRead,BufEnter *.snippets :setfiletype snippets
  autocmd BufNew,BufNewFile,BufRead,BufEnter *.ts :setfiletype typescript
  autocmd BufNew,BufNewFile,BufRead,BufEnter *.md :setfiletype markdown
  autocmd BufNew,BufNewFile,BufRead,BufEnter *.s :setfiletype nasm
  autocmd FileType vim setlocal foldmethod=marker
augroup end
