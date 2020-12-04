#!/usr/bin/env bash
set -euo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [ $# -eq 0 ]; then
    echo "usage: ./run {day}"
    echo "for example: ./run 1"
    exit 1
fi

re='^[0-9]+$'
if ! [[ $1 =~ $re ]] ; then
   echo "error: please pass a number as an argument"
   exit 1
fi

binaries=$DIR/bin
mkdir -p $binaries

script=$DIR/day$1.hs
binary=$binaries/day$1

ghc $script -hidir $binaries -odir $binaries -o $binary
time $binary