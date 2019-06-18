# Copyright 2019 Furzoom.com. All Rights Reserved.
# FPU math
#
#   FADD  - Floating-point addition
#   FDIV  - Floating-point division
#   FDIVR - Reverse floating-point division
#   FMUL  - Floating-ponit multiplication
#   FSUB  - Floating-point substraction
#   FSUBR - Reverse floating-point substraction
#
#   Each one has 6 formats:
#     FADD source - Add a 32- or 64-bit value from memory to the ST0
#     FADD %st(x), %st(0) - Add st(x) to st(0) and store the result in st(0)
#     FADD %st(0), %st(x) - Add st(0) to st(x) and store the result in st(x)
#     FADDP %st(0), %st(x) - Add st(0) to st(x), store the result in st(x),
#                           and pop st(0)
#     FADDP - Add st(0) to st(1), store the result in st(1), and pop the st(0)
#     FIADD source - Add a 16- or 32-bit integer value to st(0), and store
#                    the result in st(0)
#

# ((43.65 / 22) + (76.34 * 3.1)) / ((12.34 * 6) - (140.2 / 94.21))
.section .data
# initialized data here
value1:
  .float 43.65
value2:
  .int 22
value3:
  .float 76.34
value4:
  .float 3.1
value5:
  .float 12.43
value6:
  .int 6
value7:
  .float 140.2
value8:
  .float 94.21
output:
  .asciz "The result is %f\n"

.section .bss
#  uninitialized data here

.section .text
.globl _start
_start:
# instruction code goes here
  finit
  flds  value1
  fidiv value2
  flds  value3
  flds  value4
  fmul  %st(1), %st(0)
  fadd  %st(2), %st(0)
  flds  value5
  fimul value6
  flds  value7
  flds  value8
  fdivrp
  fsubr %st(1), %st(0)
  fdivr %st(2), %st(0)
  subl  $8, %esp
  fstpl (%esp)
  pushl $output
  call printf
  addl  $12, %esp

# exit normally
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

