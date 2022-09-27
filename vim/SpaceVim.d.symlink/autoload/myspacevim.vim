function! myspacevim#before() abort
endfunction

function! myspacevim#after() abort
    "Undo and redo
    noremap l u
    noremap L U

    "Movement
    noremap u k
    noremap U <C-u>
    noremap e j
    noremap E <C-d>
    noremap n b
    noremap N H
    noremap i w
    noremap I L

    "Get back the nuei keys
    noremap h i
    noremap H I
    noremap k n
    noremap K N
    noremap j e

endfunction
