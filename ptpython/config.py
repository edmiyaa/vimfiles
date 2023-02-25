from ptpython.layout import CompletionVisualisation


def configure(repl):
    repl.vi_mode = True
    repl.insert_blank_line_after_output = False
    repl.completion_visualisation = CompletionVisualisation.POP_UP
    repl.show_docstring = True
    repl.enable_fuzzy_completion = True
    repl.use_code_colorscheme('vim')

