# Copyright 2019 Furzoom.com. All Rights Reserved.
# SHIFT
#
#   SAL - shift arithmetic left
#     SAL destination
#     SAL %cl, destination
#     SAL shifter, destination
#   SHL - shift logical left. Same as SAL.
#   SAR - shift arithmetic right. Fills with signed bit.
#     SAR destination
#     SAR %cl, destination
#     SAR shifter, destination
#   SHR - shift logical right.
#     SHR destination
#     SHL %cl, destination
#     SHL shifter, destination
#   ROL - rotate value left
#   ROR - rotate value right
#   RCL - rotate left and include carry flag
#   RCR - rotate right and include carry flag
#

.section .data
# initialized data here
value1:
  .int 25

.section .bss
#  uninitialized data here

.section .text
.globl _start
_start:
# instruction code goes here
  # shift left
  movl  $10, %ebx
  sall  %ebx
  movb  $2, %cl
  sall  %cl, %ebx
  sall  $2, %ebx
  sall  value1
  sall  $2, value1

  movb  $0xFF, %dl
  shlb  $2, %dl
  movb  $0xFF, %dl
  salb  $2, %dl

  # shift right
  movb  $0xAA, %al
  sarb  %al
  shrb  %al

  # rotate
  movb  $0xF0, %al
  rolb  %al
  rolb  $1, %al
  rorb  %al
  clc
  rclb  $2, %al
  rcrb  %al

# exit normally
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

