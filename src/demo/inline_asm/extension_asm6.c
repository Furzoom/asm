// Copyright 2019 Furzoom.com. All Rights Reserved.
// Changed registers list

#include <stdio.h>

int main() {
  int data1 = 10;
  int data2 = 20;

  __asm__ __volatile__ ("movl %1, %%eax\n\t"
                        "imull %%eax, %0"
                        : "=r"(data2)
                        : "r"(data1), "0"(data2)
                        : "eax");  // can also be "%eax".
  printf("The result is %d\n", data2);

  return 0;
}

