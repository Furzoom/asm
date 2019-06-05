# Copyright 2019 Furzoom.com. All Rights Reserved.
# Convert
#
#   CVT
#     - CVTDQ2PD
#     - CVTDQ2PS
#     - CVTPD2DQ
#     - CVTPD2PI
#     - CVTPD2PS
#     - CVTPI2PD
#     - CVTPI2PS
#     - CVTPS2DQ
#     - CVTPS2PD
#     - CVTPS2PI
#     - CVTTPD2PI
#     - CVTTPD2DQ
#     - CVTTPS2DQ
#     - CFTTPS2PI
#

.section .data
# initialized data here
value1:
  .float 11.22, 33.44, 55.66, 77.88
value2:
  .int 1, 2, 3, 4

.section .bss
#  uninitialized data here
  .lcomm data, 16

.section .text
.globl _start
_start:
# instruction code goes here
  cvtps2dq  value1, %xmm0
  cvttps2dq value1, %xmm1
  cvtdq2ps  value2, %xmm2
  movdqu  %xmm0, data

# exit normally
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

