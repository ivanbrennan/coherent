if exists("g:autoloaded_coherent_specsetup") | finish | endif
let g:autoloaded_coherent_specsetup = 1

func! specsetup#vmux()
  VmuxPrimary
  let g:spec_runner_dispatcher = "call system(\"tmux send -t " . g:vmux_primary . " C-L '{command}' ENTER\")"
endf

func! specsetup#vtux()
  let g:spec_runner_dispatcher = "VtrSendCommand! {command}"
  echo 'g:spec_runner_dispatcher = "' . g:spec_runner_dispatcher . '"'
endf

func! specsetup#fifo()
  let g:spec_runner_dispatcher = "silent !echo clear > test_commands && echo {command} > test_commands"
  echo 'g:spec_runner_dispatcher = "' . g:spec_runner_dispatcher . '"'
endf
