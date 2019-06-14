// Copyright 2019 Furzoom.com. All Rights Reserved.
// Implicit output values

#include <stdio.h>

int main() {
  const char *input = "This is a test message.\n";
  char output[30];
  int length = 25;

  __asm__ __volatile__ ("cld\n\t"
                        "rep movsb"
                        :
                        : "S"(input), "D"(output), "c"(length));

  printf("%s", output);

  return 0;
}

