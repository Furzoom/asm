# Copyright 2019 Furzoom.com. All Rights Reserved.
# FPU stack
#
#   FINIT - Initialize Processor
#   FILDS - Integer Load (16 bit integer)
#   FILDL - Integer Load (32 bit integer)
#   FISTS - Integer Store (16 bit integer)
#   FISTL - Integer Store (32 bit integer)
#   FLDS  - Load real (32 bit)
#   FLDL  - Load real (64 bit)
#   FST   - Store Real
#   FSTS  - Store Real (32 bit)
#   FSTL  - Store Real (64 bit)
#   FSTP  - Store Real and Pop
#   FSTPS - Store Real and Pop (32 bit)
#   FSTPL - Store Real and Pop (64 bit)
#

.section .data
# initialized data here
value1:
  .int 40
value2:
  .float 92.4405
value3:
  .double 221.440321

.section .bss
#  uninitialized data here
  .lcomm int1, 4
  .lcomm control, 2
  .lcomm status, 2
  .lcomm result, 4

.section .text
.globl _start
_start:
# instruction code goes here
  finit
  fstcw control
  fstsw status
  filds value1
  fists int1
  flds  value2
  fldl  value3
  fst   %st(4)
  fxch  %st(1)
  fstps result

# exit normally
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

