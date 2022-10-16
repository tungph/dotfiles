function! myspacevim#before() abort
endfunction

function! myspacevim#after() abort
    "Undo and redo
    noremap l u
    noremap L <C-r>

    "Movement
    noremap u k
    noremap U <C-u>
    noremap e j
    noremap E <C-d>
    noremap n b
    noremap N 0
    noremap i w
    noremap I $

    "Get back the nuei keys
    noremap h i
    noremap H I
    noremap k n
    noremap K N
    noremap j e

    " Put anything you want to happen only in Neovide here
    if exists("g:neovide")
        " set guifont=FiraCode\ Nerd\ Font\ Mono:h13
        " set guifont=UbuntuMonoDerivativePowerline\ Nerd\ Font:h15
        set guifont=Jetbrains\ Mono:h12

        let g:neovide_remember_window_size = v:true

        " toggle fullscreen
        noremap <C-e> :let g:neovide_fullscreen = !g:neovide_fullscreen<CR>

    endif

endfunction
