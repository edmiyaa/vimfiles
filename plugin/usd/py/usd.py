import vim
from subprocess import Popen, PIPE

from pxr import UsdUtils


def _fzf(choices, extra_args=''):
    cmd = Popen('fzf {}'.format(extra_args), stdin=PIPE, stdout=PIPE)
    stdout = cmd.communicate(input='\n'.join(choices))[0]
    if stdout:
        return stdout.strip().split('\n')
    return []


def get_usd_dependencies(usdpath):
    sublayers, references, payloads = UsdUtils.ExtractExternalReferences(usdpath)
    return sublayers, references, payloads


def list_usd_dependencies(usdpath):
    sublayers, references, payloads = get_usd_dependencies(usdpath)
    if not any([sublayers, references, payloads]):
        print('No dependencies found in "{}"'.format(usdpath))
        return
    sel_path = _fzf(sublayers + references + payloads)
    if sel_path:
        sel_path = sel_path[0]
        vim.command('e {}'.format(sel_path))
    else:
        print('No path selected. Aborting...')
