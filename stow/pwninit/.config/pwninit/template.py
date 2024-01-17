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
    context.terminal = ['tmux', 'split-window', '-h', '-F', '#\x7bpane_id\x7d', '-P']

context.log_level = 'debug'
context.timeout = 1

###### START #######

gdbscript = '''
b * __libc_start_main
b * main
c
'''

p = start()
ru = p.recvuntil # delimeter: bytes, drop: bool = False
r  = p.recv # num_bytes: int
sla = p.sendlineafter # delimeter: bytes, payload: bytes
sa = p.sendafter # delimeter: bytes, string: bytes
sl = p.sendline # line: bytes
s = p.send # data: bytes

# Good luck pwning :)



p.interactive()
