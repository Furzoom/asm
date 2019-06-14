// Copyright 2019 Furzoom.com. All Rights Reserved.
// Jump in inline assemble.
// Use number label. Use f(oreward) and b(ehind) to specify jump direction

#include <stdio.h>

int main() {
  int data1 = 10;
  int data2 = 20;
  int result;

  __asm__ __volatile__ ("cmp %1, %2\n\t"
                        "jge 0f\n\t"
                        "movl %1, %0\n\t"
                        "jmp 1f\n"
                        "0:\n\t"
                        "movl %2, %0\n"
                        "1:"
                        : "=r"(result)
                        : "r"(data1), "r"(data2));

  printf("The result is %d\n", result);

  return 0;
}

