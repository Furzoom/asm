Compile
=====

## Starting point

The `_start` label is used to indicate the instruction from which the
program should start running. You can use the `-e` parameter of the linker
to define what the new starting point is called.

If you use `gcc`, it looks for `main` label to determine the beginning
of the program.

## Compile

For GNU linker:

```shell
as foo.s -o foo.o
ld foo.o -o foo
```

For gcc:

```shell
gcc foo.s -o foo
```

## Using C Library Functions in Assembly

First, you should explicitly linked the standard C dynamic library -- using
`-lc` argument for ld. Then, explicitly specify the dynamic linker -- using
`-dynamic-linker /lib64/ld-linux-x86-64.so.2`.

```shell
as foo.s -o foo.o
ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 -lc foo.o -o foo 
```

## Debug Assembly

If we want to debug the assembly code, assemble it with `-gstabs`.

```shell
as --gstabs foo.s -o foo.o
```

We can show it as:

```shell
objdump --stabs foo
```

## X86\_64 calling convention:

- Integer arguments (including pointers) are placed in the registers
  %rdi, %rsi, %rdx, %rcx, %r8, and %r9, in that order.
- Floating point arguments are placed in the registers %xmm0-%xmm7,
  in that order.
- Arguments in excess of the available registers are pushed onto the stack.
- If the function takes a variable number of arguments (like printf) then
  the %eax register must be set to the number of floating point arguments.
- The called function may use any registers, but it must restore the values
  of the registers %rbx, %rbp, %rsp, and %r12-%r15, if it changes them.
- The return value of the function is placed in %eax.

Register | Purpose       | Saved?
---      | ---           | ---
%rax     | result        | not saved
%rbx     | scratch       | callee saves
%rcx     | argument 4    | not saved
%rdx     | argument 3    | not saved
%rsi     | argument 2    | not saved
%rdi     | argument 1    | not saved
%rbp     | base pointer  | callee saves
%rsp     | stack pointer | callee saves
%r8      | argument 5    | not saved
%r9      | argument 6    | not saved
%r10     | scratch       | CALLER saves
%r11     | scratch       | CALLER saves
%r12     | scratch       | callee saves
%r13     | scratch       | callee saves
%r14     | scratch       | callee saves
%r15     | scratch       | callee saves



