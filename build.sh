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

as -gstabs+ -o $obj $1 && ld -o $target $obj
