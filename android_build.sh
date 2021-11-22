#!/bin/bash
API=21
#armv7-a
ARCH=armv7
PREFIX=../out-ffmpeg/$ARCH
TOOLCHAIN=/home/jiang/ffmpeg/android-ndk-r21e-linux-x86_64/android-ndk-r21e/toolchains/llvm/prebuilt/linux-x86_64

build()
{
    ./configure \
    --prefix=$PREFIX \
    --disable-static \
    --enable-shared \
    --enable-small \
    --enable-gpl \
    --disable-doc \
    --disable-programs \
    --disable-avdevice \
    --enable-cross-compile \
    --target-os=android \
    --arch=$ARCH \
    --cc=$TOOLCHAIN/bin/armv7a-linux-androideabi$API-clang \
    --cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi-

    make clean
    make -j4
    make install
}

build
