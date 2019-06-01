#!/bin/bash

if [[ $# -lt 1 ]]
then
  echo "Usage: $0 <target>"
  exit 0
fi

src_dir=$(dirname $1 | sed 's@src@@')
build_dir="build/$src_dir"
name=`basename $1 .s`
target="$build_dir/$name"
obj="$build_dir/${name}.o"

if [[ ! -d $build_dir ]]
then
  mkdir -p $build_dir
fi

ld_linker=`ldd $(which bash) |  grep ld-linux | cut -f 1 -d " " | cut -f 2`

as -gstabs+ -o $obj $1 && \
  ld -dynamic-linker $ld_linker -o $target -lc $obj

