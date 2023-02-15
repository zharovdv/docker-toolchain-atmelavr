# docker-toolchain-atmelavr

This is a docker container that builds the [arduino toolchain](https://github.com/arduino/toolchain-avr) cross and canadian.

# Motivation

Building something from sources it's difficult. Building gcc is more difficult. Building cross gcc is more more... etc. The main problem is in building environment. This docker container create reproducible building enviroment to build toolchain for arduino/platformio under microsoft windows. Why not using toolchain going with arduino/platformio? Because of lack of iconv support and "cc1plus.exe: error: no iconv implementation, cannot convert from A to B" issue. 

# Download

You could download and install the latest version from the [Releases](https://github.com/zharovdv/docker-toolchain-atmelavr/releases) page.

Alternatively, you may build it yourself from source.

# Build

To create the image, run `docker build -t toolchain-atmelavr .`.

To build you could do something like `docker run -it --rm -v /tmp/toolchain:/toolchain toolchain-atmelavr`.
