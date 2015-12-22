# asm

AT&amp;T assembly programming notes. http://furzoom.com/linux-asm-contents/

## help

```sh
as -o demo.o demo.s
ld -o demo demo.o
# or
ld -dynamic-linker /lib/ld-linux.so.2 -o demo -lc demo.o

as -gstabs -o demo.o demo.s

gcc -o demo demo.c -pg
./demo
gprof demo > gprof.txt
```
