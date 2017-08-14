" cscope.vim - Add cscope navigation bindings
" Author: Jim Stewart <http://github.com/fweep>

if exists('g:loaded_cscope') || !has('cscope') || &cp || v:version < 700
  finish
endif
let g:loaded_cscope = 1

if !exists('g:cscope_file')
  let g:cscope_file = 'cscope.out'
endif

set nocscopetag
set cscopeverbose

if has('quickfix')
  set cscopequickfix=s-,c-,d-,i-,t-,e-,a-
endif

if filereadable(g:cscope_file)
  set nocscopeverbose
  execute 'cscope add' g:cscope_file
  set cscopeverbose
endif

if !exists('g:cscope_suppress_keymaps') || g:cscope_suppress_keymaps
  nnoremap <Leader>fs :cscope find s <C-R>=expand("<cword>")<CR><CR>:botright cwindow<CR>
  nnoremap <Leader>fg :cscope find g <C-R>=expand("<cword>")<CR><CR>:botright cwindow<CR>
  nnoremap <Leader>fc :cscope find c <C-R>=expand("<cword>")<CR><CR>:botright cwindow<CR>
  nnoremap <Leader>ft :cscope find t <C-R>=expand("<cword>")<CR><CR>:botright cwindow<CR>
  nnoremap <Leader>fe :cscope find e <C-R>=expand("<cword>")<CR><CR>:botright cwindow<CR>
  nnoremap <Leader>ff :cscope find f <C-R>=expand("<cfile>")<CR><CR>:botright cwindow<CR>
  nnoremap <Leader>fa :cscope find a <C-R>=expand("<cfile>")<CR><CR>:botright cwindow<CR>
  nnoremap <Leader>fd :cscope find d <C-R>=expand("<cword>")<CR><CR>:botright cwindow<CR>
  nnoremap <Leader>fi :cscope find i ^<C-R>=expand("<cfile>")<CR>$<CR>:botright cwindow<CR>
endif

function! s:CscopeReload()
  set nocscopeverbose
  execute 'cscope kill' g:cscope_file
  execute 'cscope add' g:cscope_file
  set cscopeverbose
endfunction

command! CscopeReload :call s:CscopeReload()
