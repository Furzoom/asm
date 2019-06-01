# Copyright 2019 Furzoom.com. All Rights Reserved.
# Conditional move
# We have
#   UNSIGNED
#   cmova/cmovnbe   CF = 0 AND ZF = 0
#   cmovae/cmovne   CF = 0
#   cmovnc          CF = 0
#   cmovb/cmovnae   CF = 1
#   cmovc           CF = 1
#   cmovbe/cmovna   CF = 1 OR ZF = 1
#   cmove/cmovz     ZF = 1
#   cmovne/cmovnz   ZF = 0
#   cmovp/cmovpe    PF = 1
#   cmovnp/comvpo   PF = 0
#
#   SIGNED
#   cmovge/cmovnl   SF = 0 XOR OF = 0
#   cmovl/cmovnge   SF = 1 XOR OF = 1
#   cmovle/cmovng   (SF xor OF) or ZF = 0
#   cmovo           OF = 1
#   cmovno          OF = 0
#   cmovs           SF = 1
#   cmovns          SF = 0

.section .data
# initialized data here
output:
  .asciz "The largest value is %d\n"
values:
  .int 105, 235, 61, 315, 134, 221, 53, 145, 117, 2

.section .bss
#  uninitialized data here

.section .text
.globl _start
_start:
# instruction code goes here
  movl  $0, %eax
  movl  $0, %ebx
  cmp   %eax, %ebx  # cmp just do %ebx - %eax and set the EFLAGS

  # test carry flag
  movb  $0x1, %al
  movb  $0x2, %bl
  sub   %bl, %al    # CF set

  movb  $0x80, %al
  movb  $0x80, %bl
  add   %al, %bl    # CF set

  # test overflow flag
  movb  $0x7f, %al
  movb  $0x7f, %bl
  add   %bl, %al    # OF set

  movb  $0x80, %al
  movb  $0x80, %bl
  add   %al, %bl    # OF set

  # test OF and SF
  movb  $0xFF, %al
  movb  $0xFE, %bl
  cmp   %al, %bl
  cmp   %bl, %al

  movb  $0x80, %al
  movb  $0x7F, %bl
  cmp   %al, %bl
  cmp   %bl, %al

  # search for largest value
  movl  values, %ebx
  movl  $0x1, %edi
loop:
  movl  values(, %edi, 4), %eax
  cmp   %ebx, %eax
  cmova %eax, %ebx
  inc   %edi
  cmp   $10, %edi
  jne   loop

  pushl %ebx
  pushl $output
  call  printf
  addl  $8, %esp

  pushl $0
  call  exit

# exit normally
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

