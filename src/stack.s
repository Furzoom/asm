# Copyright 2019 Furzoom.com. All Rights Reserved.
# Stack
#
#   pushl/popl
#   pushw/popw
#
#   pusha/popa      - all 32 bits general registers.
#   pushal/popal    - same as above
#   pushf/popf      - 32 bits of EFLAGS
#   pushfl/popfl    - same as above

.section .data
# initialized data here
data:
  .int 0x55

.section .bss
#  uninitialized data here

.section .text
.globl _start
_start:
# instruction code goes here
  pushl data
  pushl $data
  pushw %ax
  pushl %ebx

  popl %eax
  popw %bx
  popl %edi
  popl %ecx

  pushal
  pusha
  popa
  popal

  pushf
  pushfl
  popfl
  popf


# exit normally
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

