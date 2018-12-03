; System V AMD64 ABI
; RAX - stores syscall number
; RDI, RSI, RDX, RCX, R8, R9 - syscall arguments
; See x86_64 table: https://w3challs.com/syscalls/?arch=x86_64
;
; Syscall 0x3b = 59 (execve)
; http://man7.org/linux/man-pages/man2/execve.2.html
; execve(%rdi: const char *filename, %rsi: char *const argv, %rdx: char *const envp)
;
; To see more syscalls for different OS/CPU use this link: https://w3challs.com/syscalls/

        section .text
        global _start
_start:
        xor rax, rax
        mov rsi, rax
        mov rdx, rax
        lea rdi, [rel msg]

        add al, 0x3b

        syscall
        msg db '/bin/sh', 0
