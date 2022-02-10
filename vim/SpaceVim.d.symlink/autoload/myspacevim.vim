function! myspacevim#before() abort
endfunction

function! myspacevim#after() abort
    "Undo and redo
    noremap l u
    noremap L <C-R>
    noremap h i
    noremap H I

    "Movement
    noremap u k
    noremap U K
    noremap e j
    noremap E J
    noremap n b
    noremap N H
    noremap i w
    noremap I L

    nnoremap <Esc> <Esc>:

    "Splitter "
    noremap kf <C-W>k
    noremap ks <C-W>j
    noremap kr <C-W>h
    noremap kt <C-W>l
    noremap K  :vsplit<CR>
endfunction
