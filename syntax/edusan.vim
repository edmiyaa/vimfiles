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

hi def link taskStatusTodo GruvboxRedBold
hi def link taskStatusInProgress GruvboxYellowBold
hi def link taskStatusWaiting GruvboxOrangeBold
hi def link taskStatusTesting GruvboxGreenBold
hi def link taskStatusDone GruvboxGray
hi def link taskStatusDiscarded GruvboxGray

hi def link day GruvboxPurpleBold
hi taskDash gui=bold

let b:current_syntax = 'edusan'

