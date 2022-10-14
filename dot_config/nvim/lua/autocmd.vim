let g:wiki_filetypes = [ 'md', 'markdown',  'wiki']
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''",'*':'*','**':'**','~~':'~~',}
" let g:ctrlp_map = '<c-m>'
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_view_general_options = '-shell-escape'

augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END
