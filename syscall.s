.section .rodata
MSG:           .ascii "Hello World\n"
SYS_write:     .quad 1
SYS_exit:      .quad 60
STDOUT_FILENO: .quad 1

.section .text
.globl _start

_start:
    # print to stdout using `write()` syscall
    movq SYS_write, %rax     # first arg (syscall no)
    movq STDOUT_FILENO, %rdi # second arg (fd no)
    movq $MSG, %rsi          # third arg (message)
    movq $13, %rdx           # fourth arg (message length)
    syscall

    # exit the program using `exit()` syscall
    movq SYS_exit, %rax      # first arg (syscall no)
    movq $0, %rdi            # second arg (exit status)
    syscall
