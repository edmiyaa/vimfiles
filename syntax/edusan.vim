" Vim syntax file
" Language: Edusan's TODO file
" Maintainer: Eduardo Miyashiro Asato
" Filenames: *.edusan

syn match taskStatusTodo '\[TODO]'
syn match taskStatusInProgress '\[INPROGRESS]'
syn match taskStatusWaiting '\[WAITING]'
syn match taskStatusTesting '\[TESTING]'
syn match taskStatusDone '\[DONE]' nextgroup=taskDoneTextDescription
syn match taskStatusDiscarded '\[DISCARDED]'

syn match taskDoneTextDescription '.*$' contained

syn match taskDash '^\s\+-'
syn match day '^\[\d\{4}-\d\{2}-\d\{2}]'

hi taskStatusTodo guifg=Red gui=bold
hi taskStatusInProgress guifg=Yellow gui=bold
hi taskStatusWaiting guifg=Orange gui=bold
hi taskStatusTesting guifg=Green gui=bold
hi taskStatusDone guifg=DarkGray gui=bold
hi taskStatusDiscarded guifg=DarkGray gui=bold

hi taskDoneTextDescription guifg=DarkGray

hi day guifg=Cyan gui=bold
hi taskDash gui=bold

let b:current_syntax = 'edusan'

