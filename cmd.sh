#!/bin/bash -ex

UPP=`pwd`

mkdir -p toolchain/cross
cd toolchain/cross
PFX=`pwd`
$UPP/build.sh
cd -

export PATH="$PFX/objdir/bin:$PATH"

mkdir -p toolchain/canadian
cd toolchain/canadian
PFX=`pwd`
CROSS_COMPILE=mingw $UPP/build.sh
cd -