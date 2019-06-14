// Copyright 2019 Furzoom.com. All Rights Reserved.
// Basic usage

#include <stdio.h>

int main() {
  int data1 = 10;
  int data2 = 20;
  int result;

  __asm__ __volatile__ ("imull %%edx, %%eax\n\t"
                        : "=a"(result)
                        : "d"(data1), "a"(data2));
  printf("The result is %d\n", result);

  return 0;
}

