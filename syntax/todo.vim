" Vim syntax file
" Language: TODO file
" Maintainer: Eduardo Miyashiro Asato
" Filenames: *.todo

syn match taskStatusTodo /\v\[TODO\]/
syn match taskStatusInProgress /\v\[INPROGRESS\]/
syn match taskStatusWaiting /\v\[WAITING\]/
syn match taskStatusTesting /\v\[TESTING\]/
syn match taskStatusDone /\v( *)\[DONE\].*(\n\1 +.*)*/  " Why does \W don't match - ?

syn match taskStatusDiscarded /\v\[DISCARDED\].*$/

syn match taskDash /^\s+-/
syn match day /\v^\[\d{4}-\d{2}-\d{2}\]/

hi def link taskStatusTodo WarningMsg
hi def link taskStatusInProgress ModeMsg
hi def link taskStatusWaiting Question
hi def link taskStatusTesting Title
hi def link taskStatusDone LineNr
hi def link taskStatusDiscarded LineNr

hi def link day WildMenu
hi taskDash gui=bold

syntax sync fromstart

let b:current_syntax = 'todo'

