"""""""""""
"KEYBINDS"
""""""""""
"Update on esc lol
" inoremap <silent><esc> <esc>:update<cr> 
"Tabs
nnoremap <leader>nt :tabnew<CR>
nnoremap <leader>nj :-tabmove<CR>
nnoremap <leader>nk :+tabmove<CR>
"Find what key does (vim-which-key)
nnoremap <silent> <leader>      :<c-u>WhichKey 'ç'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

"NerdTree
nnoremap <C-t> :CHADopen<CR>

"Execute program on Ctrl X
nnoremap <C-b> :FloatermNew --autoclose=0 gcc % -o /tmp/compiled.out && /tmp/compiled.out<CR>

"Source VIMRC while on vim
nnoremap <C-p> :source $MYVIMRC<CR>

"Open a Term
nnoremap <F2> :split <bar> term<CR>
"Exit a terminal
:tnoremap <Esc> <C-\><C-n>
"Reorder Windows
nnoremap <C-q> :TilerReorder<CR>
nnoremap <C-k> :TilerFocus<CR>


"Go to dashboard
nnoremap <C-c> :Dashboard<CR>


nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>

"Nvim go-move, its pretty pogger
nmap <S-h> <Plug>GoNSMLeft
nmap <S-j> <Plug>GoNSMDown
nmap <S-k> <Plug>GoNSMUp
nmap <S-l> <Plug>GoNSMRight

xmap <S-h> <Plug>GoVSMLeft
xmap <S-j> <Plug>GoVSMDown
xmap <S-k> <Plug>GoVSMUp
xmap <S-l> <Plug>GoVSMRight

nmap <C-h> <Plug>GoNSDLeft
nmap <C-j> <Plug>GoNSDDown
nmap <C-k> <Plug>GoNSDUp
nmap <C-l> <Plug>GoNSDRight

xmap <C-h> <Plug>GoVSDLeft
xmap <C-j> <Plug>GoVSDDown
xmap <C-k> <Plug>GoVSDUp
xmap <C-l> <Plug>GoVSDRight

function! Delete_key(...) "So enter and backspace do stuff in normal mode
  let line=getline (".")
  if line=~'^\s*$'
    execute "normal dd"
    return
  endif
  let column = col(".")
  let line_len = strlen (line)
  let first_or_end=0
  if column == 1
    let first_or_end=1
  else
    if column == line_len
      let first_or_end=1
    endif
  endif
  execute "normal i\<DEL>\<Esc>"
  if first_or_end == 0
    execute "normal l"
  endif
endfunction
nnoremap <silent> <BS> :call Delete_key()<CR>
nnoremap <silent> <CR> i<CR><Esc>
