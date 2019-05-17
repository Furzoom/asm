Directives
=====

## .ascii *"string"*

`.ascii` expects zero or more string literals separated by commas.

## .asciz *"string"*

`.asciz` is just like `.ascii`, but each string is followed by a zero byte.

## .byte *epxressions*

`.byte` expects zero or more expressions, separated by commas. Each 
expression is assembled into the next byte.

## .double *flonums*

Double-precision floating-point number.

## .float *flonums*

Single-precision floating-point number.

## .global *symbol*

`.global` makes the symbol visible to ld. `.globl` is also accepted.

## .int *expressions*

Expect zero or more expressions, of any section, separated by commas. The 
byte order and bit size of the number depends on what kind of target the 
assembly is for.

## .lcomm *symbol, length*

`.lcomm` reserves length bytes for a local common denoted by symbol. Symbol
is not  declared global, so is normally not visible to ld.

## .long *expressions*

Same as `.int` directives.

## .octa *bignums*

16-byte integer number.

## .quad *bignums*

8-byte integer number.

## .short *expressions*

16-bit integer number.

## .single *flonums*

Single-precision floating-point number.

## .section *name*

`.section` assembles the following code into a section named name.

