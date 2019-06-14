# Copyright 2019 Furzoom.com. All Rights Reserved.

AS = as
LD = ld
CC = gcc
CFLAGS = -Wall

# Remove predefined rules
.SUFFIXES:
.SUFFIXES: .o

.PHONY: clean all

# Make intermediate files list empty
.SECONDARY:

OBJECT = asmtest1 asmtest2 extension_asm extension_asm1 \
				 extension_asm2 extension_asm3 extension_asm4 \
				 extension_asm5 extension_asm6 extension_asm7 \
				 extension_asm8 extension_asm9 macro_asm

all: $(OBJECT)

%: %.o
	$(CC) $^ -o $@

%.o: %.s
	$(CC) $(CFLAGS) -c $< -o $@

%.s: %.c
	$(CC) $(CFLAGS) -S $< -o $@

clean:
	$(RM) *.s *.o $(OBJECT)

