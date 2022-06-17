" Functions {{{
"""""""""""""
" Functions "
"""""""""""""
" Stolen from https://github.com/camspiers/dotfiles/blob/master/files/.config/nvim/init.vim

" When term starts, auto go into insert mode
" autocmd TermOpen * startinsert

" Turn off line numbers etc
autocmd TermOpen * setlocal listchars= nonumber norelativenumber


" Creates a floating window with a most recent buffer to be used
function! CreateCenteredFloatingWindow()
  let width = float2nr(&columns * 0.95)
  let height = float2nr(&lines * 0.9)
  let top = ((&lines - height) / 2) - 1
  let left = (&columns - width) / 2
  let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

  let top = "╭" . repeat("─", width - 2) . "╮"
  let mid = "│" . repeat(" ", width - 2) . "│"
  let bot = "╰" . repeat("─", width - 2) . "╯"
  let lines = [top] + repeat([mid], height - 2) + [bot]
  let s:buf = nvim_create_buf(v:false, v:true)
  call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
  call nvim_open_win(s:buf, v:true, opts)
  set winhl=Normal:Floating
  let opts.row += 1
  let opts.height -= 2
  let opts.col += 2
  let opts.width -= 4
  call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
  autocmd BufWipeout <buffer> call CleanupBuffer(s:buf)
  tnoremap <buffer> <silent> <Esc> <C-\><C-n><CR>:call DeleteUnlistedBuffers()<CR>
endfunction

function! CleanupBuffer(buf)
  if bufexists(a:buf)
    silent execute 'bwipeout! '.a:buf
  endif
endfunction

" Opens lazygit
function! ToggleLazyGit()
  call ToggleTerm('lazygit')
endfunction


function! ToggleTerm(cmd)
  if empty(bufname(a:cmd))
    call CreateCenteredFloatingWindow()
    call termopen(a:cmd, { 'on_exit': function('OnTermExit') })
  else
    call DeleteUnlistedBuffers()
  endif
endfunction

" Open Project
function! ToggleProject()
  call ToggleTerm('tmuxinator-fzf-start.sh')
endfunction

" Opens a throwaway/scratch terminal
function! ToggleScratchTerm()
  call ToggleTerm('bash')
endfunction


function! OnTermExit(job_id, code, event) dict
  if a:code == 0
    call DeleteUnlistedBuffers()
  endif
endfunction

function! DeleteUnlistedBuffers()
  for n in nvim_list_bufs()
    if ! buflisted(n)
      let name = bufname(n)
      if name == '[Scratch]' ||
            \ matchend(name, ":bash") ||
            \ matchend(name, ":lazygit") ||
            \ matchend(name, ":tmuxinator-fzf-start.sh") ||
            \ matchend(name, ":hstarti")
        call CleanupBuffer(n)
      endif
    endif
  endfor
endfunction

function! CleanupBuffer(buf)
  if bufexists(a:buf)
    silent execute 'bwipeout! '.a:buf
  endif
endfunction
" }}}

nnoremap <C-p> :Files<CR>
nnoremap <C-y> :Windows<CR>
" nnoremap <C-b> :Buffers<CR>
nnoremap <Leader>ta :lua vim.lsp.buf.code_action()<CR>

" Configure FZF to use a floating window configuration
" let $FZF_DEFAULT_OPTS = '--layout=reverse --multi'
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \   'bg':      ['bg', 'Normal'],
      \   'hl':      ['fg', 'Comment'],
      \   'fg+':     ['fg', 'CursorLine'],
      \   'bg+':     ['bg', 'Normal'],
      \   'hl+':     ['fg', 'Statement'],
      \   'info':    ['fg', 'PreProc'],
      \   'border':  ['fg', 'CursorLine'],
      \   'prompt':  ['fg', 'Conditional'],
      \   'pointer': ['fg', 'Exception'],
      \   'marker':  ['fg', 'Keyword'],
      \   'spinner': ['fg', 'Label'],
      \   'header':  ['fg', 'Comment'] }

let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --no-ignore --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)

" command! -bang -nargs=* Rg
          " \ call fzf#vim#grep(
          " \   'rg --column --line-number --ignore --no-heading --color=always --smart-case --'.shellescape(<q-args>), 1,
          " \   fzf#vim#with_preview(), <bang>0)
nnoremap <C-s> :Rg<CR>

nmap <Leader>gm <Plug>(git-messenger)

" Start interactive EasyAlign in visual mode (e.g. vipga)
" xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
" nmap ga <Plug>(EasyAlign)

" let g:startify_fortune_use_unicode = 1

 nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
 nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
 nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
 nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
