# Copyright 2019 Furzoom.com. All Rights Reserved.
# Loop
#
#   LOOP
#   LOOPE/LOOPZ
#   LOOPNE/LOOPNZ

.section .data
# initialized data here
output:
  .asciz "The value is: %d\n"

.section .bss
#  uninitialized data here

.section .text
.globl _start
_start:
# instruction code goes here
  movl  $10, %ecx
  movl  $0, %eax
  jcxz  done        # if %ecx is 0, then jump to done
loop1:
  addl  %ecx, %eax
  loop  loop1

done:
  pushl %eax
  pushl $output
  call  printf
  addl  $8, %esp

# exit normally
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

