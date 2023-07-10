#!/usr/bin/env python3
from pwn import *

{bindings}

context.binary = {bin_name}

def start(argv=[], *a, **kw):
    if args.GDB:
        return gdb.debug({proc_args} + argv, gdbscript=gdbscript, *a, **kw)
    elif args.REMOTE:
        return remote(sys.argv[1], sys.argv[2], *a, **kw)
    else:
        return process({proc_args}+argv, *a, **kw)

if os.environ['TMUX']:
    a = ['new-window'] if args.TMUX_NEW else ['split-window', '-h']
    context.terminal = ['tmux'] + a

context.log_level = 'debug'

###### START #######

gdbscript = '''
b * main
c
'''

# Good luck pwning :)
p = start()

p.interactive()
