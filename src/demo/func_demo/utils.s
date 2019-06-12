# Copyright 2019 Furzoom.com. All Rights Reserved.
# Utility functions

.section .text
.type perimeter, @function
.globl perimeter
perimeter:
  pushl %ebp
  movl  %esp, %ebp
  subl  $0, %esp    # local parameter

  movl  8(%ebp), %eax
  addl  %eax, %eax
  addl  12(%ebp), %eax
  addl  12(%ebp), %eax

  movl  %ebp, %esp
  popl  %ebp
  ret


.type toint, @function
.globl toint
toint:
  pushl %ebp
  movl  %esp, %ebp
  subl  $4, %esp
  movl  $10, -4(%ebp)

  xorl  %ecx, %ecx
  movl  8(%ebp), %esi
  cld

start:
  lodsb
  cmpb  $0, %al
  je end
  subb  $'0', %al
  cmpb  $10, %al
  jnc end

  movsx %al, %ebx
  movl  %ecx, %eax
  mull  -4(%ebp)
  addl  %ebx, %eax
  movl  %eax, %ecx
  jmp start

end:
  movl  %ecx, %eax
  movl  %ebp, %esp
  popl  %ebp
  ret

