#!/bin/bash

if [[ $# -lt 1 ]]
then
  echo "Usage: $0 <target>"
  exit 0
fi

src_dir=`dirname $1`
build_dir="build"
target=`basename -s .s $1`
src=$target.s
obj=$target.o

if [[ ! -d $build_idr ]]
then
  mkdir -p $build_dir
fi

as -gstabs -o $build_dir/$obj $src_dir/$src && \
  ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 -o $build_dir/$target -lc $build_dir/$obj