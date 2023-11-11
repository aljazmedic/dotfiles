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
    context.terminal = ['tmux', 'split-window', '-h', '-F', '#{pane_id}', '-P']

context.log_level = 'debug'

###### START #######

gdbscript = '''
b * __libc_start_main
b * main
c
'''

p = start()
ru = lambda a:  p.recvuntil(a)
r  = lambda a:  p.recv(a)
sla = lambda a,b: p.sendlineafter(a,b)
sa = lambda a,b: p.sendafter(a,b)
sl = lambda a: p.sendline(a)
s = lambda a: p.send(a)

# Good luck pwning :)



p.interactive()
