# Copyright 2019 Furzoom.com. All Rights Reserved.
# strlen
#

.section .data
# initialized data here
string1:
  .asciz "Testing, one, two, three, testing.\n"

.section .bss
#  uninitialized data here

.section .text
.globl _start
_start:
# instruction code goes here
  leal string1, %edi
  movl $0xffff, %ecx
  movb $0, %al
  cld
  repne scasb
  jne notfound
  subw $0xffff, %cx
  neg %cx
  dec %cx
  movl $1, %eax
  movl %ecx, %ebx
  int $0x80

# exit normally
notfound:
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

