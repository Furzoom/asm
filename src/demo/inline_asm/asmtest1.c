// Copyright 2019 Furzoom.com. All Rights Reserved.
// Check the assemble code
//

#include <stdio.h>

int main() {
  int a = 10;
  int b = 20;
  int result;
  result = a * b;
  __asm__("nop");
  printf("The result is %d\n", result);
  return 0;
}

