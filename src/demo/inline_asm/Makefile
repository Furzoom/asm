# Copyright 2019 Furzoom.com. All Rights Reserved.

AS=as
LD=ld
CC=gcc
CFLAGS=-Wall

all: asmtest1 asmtest2

asmtest1: asmtest1.o
	$(CC) $^ -o $@

asmtest2: asmtest2.o
	$(CC) $^ -o $@

asmtest1.o: asmtest1.s
	$(CC) $(CFLAGS) -c $< -o $@

asmtest1.s: asmtest1.c
	$(CC) $(CFLAGS) -S $< -o $@

asmtest2.o: asmtest2.s
	$(CC) $(CFLAGS) -c $< -o $@

asmtest2.s: asmtest2.c
	$(CC) $(CFLAGS) -S $< -o $@


.PHONY: clean
clean:
	$(RM) *.s *.o asmtest1 asmtest2

