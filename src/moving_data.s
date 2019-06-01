# Copyright 2019 Furzoom.com. All Rights Reserved.
# Moving data

.section .data
# initialized data here
values:
  .int 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60

.section .bss
#  uninitialized data here
  .lcomm age, 4

.section .text
.globl _start
_start:
# instruction code goes here
  # move immediate data to register
  movl  $1, %eax
  # move immediate data to memory
  movl  $2, age

  # move between registers
  movl  %eax, %ebx
  movb  %cl,  %al

  # move date from memory to a register
  movl  age,  %edx
  # move data from a register to memory
  movl  %ebx, age
  # using indexed memory locations
  #   base_address (offset_addresss, index, size)
  # the offset_address and index must be registers
  movl  $2, %edi
  movl  values(, %edi, 4), %eax
  # using indirect addressing with registers
  movl  $values, %edi
  movl  $100, 4(%edi)

# exit normally
  movl  $1, %eax
  movl  $0, %ebx
  int   $0x80

