#!/bin/bash

nasm -f elf64 -o shell.o shell.asm && ld -o /tmp/shell shell.o && rm shell.o
for i in $(objdump -d /tmp/shell | grep "^ " | cut -f2); do echo -n '\x'$i; done; echo
