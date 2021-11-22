#!/bin/bash
API=21
#arm64  x86 x86_64 <----> aarch64  i686  x86_64
ARCH=arm64
ARCH2=aarch64    
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
    --cc=$TOOLCHAIN/bin/$ARCH2-linux-android$API-clang \
    --cross-prefix=$TOOLCHAIN/bin/$ARCH2-linux-android-

    make clean
    make -j4
    make install
}

build
