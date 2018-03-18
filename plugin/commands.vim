if exists("g:loaded_coherent_commands") | finish | endif
let g:loaded_coherent_commands = 1

command! -nargs=0 SynStack call coherent#synstack()
command! -nargs=0 SyntaxHighlight call coherent#syntaxhighlights(-1)
command! -nargs=? SyntaxHighlights call coherent#syntaxhighlights(<args>)
