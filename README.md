# x86_helloworld
Just goofing around with x86 assembly and radare2, learning and having fun. Be aware that I have no idea what I'm doing. This is written for Linux.

# Assembling
```
nasm -f elf64 -F dwarf -g -o hello.o hello.s
nasm -f elf64 -F dwarf -g -o str.o str.s 
nasm -f elf64 -F dwarf -g -o mem.o mem.s 
ld -o hello hello.o str.o mem.o
```

# Example Output
```
Hello, world! 15
Hello, world! 14
Hello, world! 13
Hello, world! 12
Hello, world! 11
Hello, world! 10
Hello, world! 9
Hello, world! 8
Hello, world! 7
Hello, world! 6
Hello, world! 5
Hello, world! 4
Hello, world! 3
Hello, world! 2
Hello, world! 1
```
