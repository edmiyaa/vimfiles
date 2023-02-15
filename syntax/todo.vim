" Vim syntax file
" Language: TODO file
" Maintainer: Eduardo Miyashiro Asato
" Filenames: *.todo

syn match taskStatusTodo '\[TODO]'
syn match taskStatusInProgress '\[INPROGRESS]'
syn match taskStatusWaiting '\[WAITING]'
syn match taskStatusTesting '\[TESTING]'
syn match taskStatusDone '\( *\)\[DONE].*\(\n\1 \+.*\)*'

syn match taskStatusDiscarded '\[DISCARDED].*$'

syn match taskDash '^\s\+-'
syn match day '^\[\d\{4}-\d\{2}-\d\{2}]'

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

