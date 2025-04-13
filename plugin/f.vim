if exists("g:loaded_f_vim")
    finish
endif
let g:loaded_f_vim = 1

if (!exists('g:f_command'))
  let g:f_command = "f"
endif

command! -nargs=* F lua require("f").f(<f-args>)

nnoremap <silent> <leader>f <cmd>silent F<cr>
