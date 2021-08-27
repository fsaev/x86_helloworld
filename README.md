# x86_helloworld
Just goofing around with x86 assembly and radare2, learning and having fun. Be aware that I have no idea what I'm doing. This is written for Linux.

# Assembling
```
nasm -f elf64 -F dwarf -g -o hello.o hello.s
nasm -f elf64 -F dwarf -g -o str.o str.s 
nasm -f elf64 -F dwarf -g -o mem.o mem.s 
ld -o hello hello.o str.o mem.o
```
