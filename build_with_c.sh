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

arch=$(uname -i)
if [ "@$arch" = "@x86_64" ]
then
  as -gstabs -o $build_dir/$obj $src_dir/$src && \
    ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 -o $build_dir/$target -lc $build_dir/$obj
elif [ "@$arch" = "@i386" ]
then
  as -gstabs -o $build_dir/$obj $src_dir/$src && \
    ld -dynamic-linker /lib/ld-linux.so.2 -o $build_dir/$target -lc $build_dir/$obj
else
  echo "Unsupported architecture"
  exit 1
fi
