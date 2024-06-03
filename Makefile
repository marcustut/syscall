all: c asm

c:
	$(CC) -o csyscall syscall.c

asm:
	$(AS) -o asmsyscall.o syscall.s
	$(LD) -o asmsyscall asmsyscall.o