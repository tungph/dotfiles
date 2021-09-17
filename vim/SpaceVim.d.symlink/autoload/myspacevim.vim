function! myspacevim#before() abort
endfunction

function! myspacevim#after() abort
    inoremap uu  <Esc>
    inoremap aa <Esc>
    "Undo and redo
    noremap l u
    noremap L <C-R>
    noremap a i
    noremap t f
    map <BS> ;

    "Movement
    noremap u k
    noremap ( {
    noremap e j
    noremap [ }
    noremap n h
    noremap _ ^
    noremap i l
    noremap ] $
    noremap m b

    nnoremap <Esc> <Esc>:
    inoremap <Esc> <Esc>:

    "Splitter "
    noremap su <C-W>k
    noremap se <C-W>j
    noremap sn <C-W>h
    noremap si <C-W>l
    noremap S  :vsplit<CR>
endfunction
