if !get(g:, 'aerial_default_bindings', 1)
  finish
endif
" Use <CR> to jump to the location, just like with the quickfix
nnoremap <buffer> <CR> <cmd>lua require'aerial'.select()<CR>
" Jump to location in a vertical split
nnoremap <buffer> <C-v> <cmd>lua require'aerial'.select({vwin=2})<CR>
" Jump to location in a horizontal split
nnoremap <buffer> <C-s> <cmd>lua require'aerial'.select({vwin=2, split='belowright split'})<CR>
" Use p to scroll to the location under cursor but stay in the aerial window
nnoremap <buffer> p <cmd>lua require'aerial'.select({jump=false})<CR>
" Hold ctrl + j/k to go up and down while scrolling to the location under cursor
nnoremap <buffer> <C-j> j<cmd>lua require'aerial'.select({jump=false})<CR>
nnoremap <buffer> <C-k> k<cmd>lua require'aerial'.select({jump=false})<CR>
" Use [[]] to jump to the prev/next item
nnoremap <buffer> [[ <cmd>lua require'aerial'.next(1)<CR>
nnoremap <buffer> ]] <cmd>lua require'aerial'.next(-1)<CR>
" q closes
nnoremap <buffer> q <cmd>lua require"aerial".close()<CR>

"""" Tree commands
" o toggles the tree
nnoremap <buffer> o <cmd>lua require"aerial".tree_cmd('toggle')<CR>
" O toggles the tree recursively
nnoremap <buffer> O <cmd>lua require"aerial".tree_cmd('toggle', {recurse=true})<CR>

" l opens the tree and moves the cursor
nnoremap <buffer> l l<cmd>lua require"aerial".tree_cmd('open', {bubble=false})<CR>