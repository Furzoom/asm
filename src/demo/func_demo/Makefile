# Copyright 2019 Furzoom.com. All Rights Reserved.

AS=as
LD=ld
FLAGS=-gstabs+

all: main

main: main.o utils.o
	$(LD) $^ -o $@

%.o: %.s
	$(AS) $(FLAGS) $^ -o $@

.PHONY: clean
clean:
	$(RM) *.o main

