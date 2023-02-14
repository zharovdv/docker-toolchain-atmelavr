#!/bin/bash -ex

TOOLCHAIN_ARCHIVE=https://github.com/arduino/toolchain-avr/archive/master.zip
wget $TOOLCHAIN_ARCHIVE -O /tmp/toolchain-avr.zip
unzip /tmp/toolchain-avr.zip
rm /tmp/toolchain-avr.zip
mv toolchain-avr*/* .
rm -rf toolchain-avr*/

if [[ x$CROSS_COMPILE != x ]] ; then
  sed -i '/tar xf mpc-${MPC_VERSION}.tar.gz/awget https://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.16.tar.gz && tar xf libiconv-1.16.tar.gz' ./gcc.build.bash
  sed -i '/mv mpc-${MPC_VERSION} gcc\/mpc/amv libiconv-1.16 gcc/libiconv' ./gcc.build.bash

  sed -i '/--with-guile/d' ./gdb.build.bash

	CROSS_COMPILE=$CROSS_COMPILE ./package-avr-gcc.bash
else
  ./package-avr-gcc.bash
fi