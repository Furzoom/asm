# Copyright 2019 Furzoom.com. All Rights Reserved.
# Data Exchange
#
#   XCHG
#   BSWAP
#   XADD
#   CMPXCHG
#   CMPXCHG8B

.section .data
# initialized data here
value:
  .int 0xAA
data:
  .byte 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88

.section .bss
#  uninitialized data here

.section .text
.globl _start
_start:
# instruction code goes here
  # xchg - exchange two registers or between a resgister and a memory address
  movl $0x11223344, %eax
  movl $0xAABBCCDD, %ebx
  xchgl %eax, %ebx
  xchgw %ax, %bx
  xchgb %al, %bl
  xchgl value, %eax

  # bswap - reverse byte order
  movl $0x12345678, %eax
  bswap %eax

  # xadd - add and exchange values
  # xadd src, dest   exchanges src and dest, stores the sum in the dest
  movl $1, %eax
  movl $2, %ebx
  xaddl %eax, %ebx
  xaddw %ax, %bx
  xaddb %al, %bl
  xaddl %eax, value

  # cmpxchg
  movl $5, value
  movl $5, %eax
  movl $10, %ebx
  cmpxchg %ebx, value   # if value equals %eax, then value = %ebx;
  cmpxchg %ebx, value   # if value not equals %eax, then %eax = value;

  # cmpxchg8b
  movl $0x44332211, %eax
  movl $0x88776655, %edx
  movl $0x12345678, %ebx
  movl $0x90ABCDEF, %ecx
  cmpxchg8b data
  cmpxchg8b data


# exit normally
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

