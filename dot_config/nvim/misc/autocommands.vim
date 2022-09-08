let acp_enableAtStartup=0
augroup omnifuncs
  " autocmd!
  autocmd BufNew,BufNewFile,BufRead,BufEnter *.snippets :setfiletype snippets
  autocmd BufNew,BufNewFile,BufRead,BufEnter *.ts :setfiletype typescript
  " autocmd BufNew,BufNewFile,BufRead,BufEnter *.md :setfiletype markdown
  autocmd BufNew,BufNewFile,BufRead,BufEnter *.s :setfiletype nasm
  au BufRead,BufNewFile * if expand('<afile>:e') == '' | :lua require('cmp').setup.buffer { enabled = false }
  au BufRead,BufNewFile * if expand('<afile>:e') == '' | :AcpEnable 
  autocmd BufNew,BufNewFile,BufRead,BufEnter *.txt :AcpEnable
  autocmd FileType vim setlocal foldmethod=marker         
augroup end

