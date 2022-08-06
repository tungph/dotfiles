function! myspacevim#before() abort
endfunction

function! myspacevim#after() abort
    "Undo and redo
    noremap l u
    noremap L U

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

    "Get back the nuei keys
    noremap h i
    noremap H I
    noremap k n
    noremap K N
    noremap j e

endfunction
