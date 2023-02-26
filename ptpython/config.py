from ptpython.layout import CompletionVisualisation


def configure(repl):
    repl.insert_blank_line_after_output = False
    repl.completion_visualisation = CompletionVisualisation.NONE
    repl.use_code_colorscheme('vim')
    repl.show_status_bar = False

