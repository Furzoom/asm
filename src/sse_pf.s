# Copyright 2019 Furzoom.com. All Rights Reserved.
# Package float - SSE, SSE2
#
#   SSE
#     - MOVAPS
#     - MOVUPS
#     - MOVSS
#     - MOVLPS
#     - MOVHPS
#     - MOVLHPS
#     - MOVHLPS
#   SSE2
#     - MOVAPD
#     - MOVUPD
#     - MOVSD
#     - MOVHPD
#     - MOVLPD
#   SSE3
#     - MOVSHDUP
#     - MOVSLDUP
#     - MOVDDUP
#

.section .data
# initialized data here
value1:
  .float 12.34, 2345.543, -3493.2, 0.44901
value2:
  .float -5439.234, 32121.4, 1.0094, 0.000003
value3:
  .double 11.22, 33.44
value4:
  .double 55.66, -77.88

.section .bss
#  uninitialized data here
  .lcomm data, 16

.section .text
.globl _start
_start:
# instruction code goes here
  # SSE
  movups value1, %xmm0
  movups value2, %xmm1
  movups %xmm0, %xmm2
  movups %xmm0, data
  movss  value1, %xmm3
  movlps value1, %xmm4
  movhps value1, %xmm5
  movlhps %xmm0, %xmm6
  movhlps %xmm0, %xmm7

  call reset

  # SSE2
  movupd value3, %xmm0
  movupd value4, %xmm1
  movupd %xmm0, %xmm2
  movupd %xmm0, data
  movsd value3, %xmm3
  movhpd value3, %xmm4
  movlpd value3, %xmm5

  call reset

  # SSE3
  movupd value1, %xmm0
  movshdup %xmm0, %xmm0

  movupd value1, %xmm1
  movsldup %xmm1, %xmm1

  movddup value3, %xmm2

# exit normally
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

# reset xmm registers
reset:
  xorps %xmm0, %xmm0
  xorps %xmm1, %xmm1
  xorps %xmm2, %xmm2
  xorps %xmm3, %xmm3
  xorps %xmm4, %xmm4
  xorps %xmm5, %xmm5
  xorps %xmm6, %xmm6
  xorps %xmm7, %xmm7
  ret

