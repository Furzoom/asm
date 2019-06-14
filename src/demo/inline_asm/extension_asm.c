// Copyright 2019 Furzoom.com. All Rights Reserved.
//
// Syntax
//  asm ("assembly code"
//       : output locations
//       : input operands
//       : changed registers);
//
//    assembly code - basic assembly code
//    ouput locations - "constraint" (variable)
//      Output Modifier:
//        = The operand can only be written to.
//        + The operand can be both read from and written to.
//

#include <stdio.h>

int main() {
  int data1 = 10;
  int data2 = 20;
  int result;

  __asm__ __volatile__ ("nop"
                        : "=a"(result)
                        : "d"(data1), "a"(data2));
  printf("The result is %d\n", result);

  return 0;
}

