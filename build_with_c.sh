#!/bin/bash

if [[ $# -lt 1 ]]
then
  echo "Usage: $0 <target>"
  exit 0
fi

src_dir=`dirname $1`
build_dir="build"
target=`basename $1 .s`
src=$target.s
obj=$target.o

if [[ ! -d $build_idr ]]
then
  mkdir -p $build_dir
fi

ld_linker=`ldd $(which bash) |  grep ld-linux | cut -f 1 -d " " | cut -f 2`

as -gstabs+ -o $build_dir/$obj $src_dir/$src && \
  ld -dynamic-linker $ld_linker -o $build_dir/$target -lc $build_dir/$obj

