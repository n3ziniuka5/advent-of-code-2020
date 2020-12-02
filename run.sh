#!/usr/bin/env bash
set -euxo pipefail

re='^[0-9]+$'
if ! [[ $1 =~ $re ]] ; then
   echo "error: please pass a number as an argument"
   exit 1
fi

script=day$1.hs
binary=./day$1

ghc $script
$binary