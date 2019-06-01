# Copyright 2019 Furzoom.com. All Rights Reserved.
# Convert a string to upper
#

.section .data
# initialized data here
string1:
  .asciz "This is a TEST, of the conversion program!\n"
length:
  .int 43

.section .bss
#  uninitialized data here

.section .text
.globl _start
_start:
# instruction code goes here
  leal string1, %esi
  movl %esi, %edi
  movl length, %ecx
  cld

loop1:
  lodsb
  cmp $'a', %al
  jb skip
  cmp $'z', %al
  ja skip
  subb $0x20, %al

skip:
  stosb
  loop loop1

end:
  pushl $string1
  call printf
  addl $4, %esp

# exit normally
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

