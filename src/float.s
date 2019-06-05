# Copyright 2019 Furzoom.com. All Rights Reserved.
# Float
#
#   FLD
#     - FLDS
#     - FLDL
#   FST
#     - FSTS
#     - FSTL
#   FLD1
#   FLDL2T
#   FLDL2E
#   FLDPI
#   FLDLG2
#   FLDLN2
#   FLDZ
#

.section .data
# initialized data here
value1:
  .float 12.34
value2:
  .double 5678.09

.section .bss
#  uninitialized data here
  .lcomm data, 8

.section .text
.globl _start
_start:
# instruction code goes here
  flds  value1
  fldl  value2
  fstl  data
  fsts  data

  fld1
  fldl2t
  fldl2e
  fldpi
  fldlg2
  fldln2
  fldz

# exit normally
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

