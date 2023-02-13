" Vim syntax file
" Language: Edusan's TODO file
" Maintainer: Eduardo Miyashiro Asato
" Filenames: *.edusan

syn match taskStatusTodo '\[TODO]'
syn match taskStatusInProgress '\[INPROGRESS]'
syn match taskStatusWaiting '\[WAITING]'
syn match taskStatusTesting '\[TESTING]'
syn match taskStatusDone '\[DONE].*$'
syn match taskStatusDiscarded '\[DISCARDED].*$'

syn match taskDash '^\s\+-'
syn match day '^\[\d\{4}-\d\{2}-\d\{2}]'

hi def link taskStatusTodo WarningMsg
hi def link taskStatusInProgress ModeMsg
hi def link taskStatusWaiting Question
hi def link taskStatusTesting Title
hi def link taskStatusDone NonText
hi def link taskStatusDiscarded NonText

hi def link day WildMenu
hi taskDash gui=bold

let b:current_syntax = 'edusan'

