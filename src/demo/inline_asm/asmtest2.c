// Copyright 2019 Furzoom.com. All Rights Reserved.
// Check the assemble code
//

#include <stdio.h>

// These must be declared as global varaiables,
// thus they can be used in inline assemble.
int a = 10;
int b = 20;
int result;

int main() {
  __asm__("pusha\n\t"
          "movl a, %eax\n\t"
          "movl b, %ebx\n\t"
          "imull %ebx, %eax\n\t"
          "movl %eax, result\n\t"
          "popa\n\t");
  printf("The result is %d\n", result);
  return 0;
}

