Directives
=====

## .align *abs-expr, abs-expr, abs-expr*

`.align` pads the location counter (in the current subxedtion) to a particular
storage boundary. The first expression (which must be absolute) is the
alignment required.

The second expression (also absolute) gives the fill value to be stored in
the padding bytes. It (and the comma) may be omitted. If it is omitted,
the padding bytes are normally zero. However, on some systems, if the section
is marked as containing code and the fill value is omitted, the space is
filled with no-op instructions.

The third expression is also absolute, and is also optional. If it is
present, it is the maximum number of bytes that should be skipped by
this alignment directive. If doing the alignment would require skipping
more bytes than the specified maximum, then the alignment is not done
at all.

## .ascii *"string"*

`.ascii` expects zero or more string literals separated by commas.

## .asciz *"string"*

`.asciz` is just like `.ascii`, but each string is followed by a zero byte.

## .byte *epxressions*

`.byte` expects zero or more expressions, separated by commas. Each 
expression is assembled into the next byte.

## .comm *symbol, length*

`.comm` declares a common symbol named symbol. When linking, a common
symbol in one object file may be merged with a defined or common symbol
of the same name in another object file. If `ld` does not see a definition
for the symbol -- just one or more common symbols -- then it will allocate
`length` bytes of uninitialized memory. `length` must be an absolute
expression. If `ld` sees multiple common symbols with the same name, and
they do not all have the same size, it will allocate space using the
largest size.

## .double *flonums*

Double-precision floating-point number.

## .equ *symbol, expression*

`.equ` sets the value of symbol to expression. It is synonymous with `.set`.

## .equiv *symbol, expression*

`.equiv` is like `.equ` and `.set`, expect that the assembler will signal an 
error if symbol is already defiend.

## .fill *repeat, size, value*

`.fill` emits `repeat` copies of `size` bytes. `value` is default value.
`repeat` and `size` may be zero or more.

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
is not declared global, so is normally not visible to ld.

## .long *expressions*

Same as `.int` directives.

## .octa *bignums*

16-byte integer number.

## .quad *bignums*

8-byte integer number.

## .set *symbol, expression*

`.set` sets the value of symbol to expression. This changes symbol's value 
and type to conform to expression. If symbol was flagged as external,
it remains flagged.

## .short *expressions*

16-bit integer number.

## .single *flonums*

Single-precision floating-point number.

## .section *name*

`.section` assembles the following code into a section named name.

[Reference directives](https://ftp.gnu.org/old-gnu/Manuals/gas-2.9.1/html_chapter/as_7.html)
