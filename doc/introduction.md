# Introduction

## Define data

```asm
testvalue:
  .long 123

# ...

  movl testvalue, %eax
  movl $testvalue, %ebx
```

Above code will set `eax` register to 123. And set `ebx` register to the 
start address of `123`.
