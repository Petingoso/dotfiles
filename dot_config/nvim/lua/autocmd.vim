let g:wiki_filetypes = [ 'md', 'markdown',  'wiki']
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''",'*':'*','**':'**','~~':'~~',}
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_compiler_latexmk = {
        \ 'options' : [
        \   '-pdf' ,
        \   '-shell-escape' ,
        \   '-verbose' ,
        \   '-file-line-error',
        \   '-synctex=1' ,
        \   '-interaction=nonstopmode' ,
        \ ],
        \}


augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END
