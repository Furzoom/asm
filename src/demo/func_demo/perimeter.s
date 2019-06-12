# Copyright 2019 Furzoom.com. All Rights Reserved.
# Function perimeter

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

