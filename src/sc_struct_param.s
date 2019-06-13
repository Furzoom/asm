# Copyright 2019 Furzoom.com. All Rights Reserved.
#

.section .data
# initialized data here
result:
uptime:
  .int 0
load1:
  .int 0
load5:
  .int 0
load15:
  .int 0
totalram:
  .int 0
freeram:
  .int 0
sharedram:
  .int 0
bufferran:
  .int 0
totalswap:
  .int 0
freeswap:
  .int 0
procs:
  .int 0
totalhigh:
  .int 0
freehigh:
  .int 0
memunit:
  .int 0
_f:
  .fill 8, 1, 0

.section .bss
#  uninitialized data here

.section .text
.globl _start
_start:
# instruction code goes here
  movl  $result, %ebx
  movl  $116, %eax
  int   $0x80

# exit normally
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

