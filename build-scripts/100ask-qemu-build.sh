#!/bin/bash

# Script dir path as global variable
SCRIPTPATH="$(
    cd "$(dirname "$0")" >/dev/null 2>&1
    pwd -P
)"

function build_clean() {
    rm -rf $SCRIPTPATH/../build/*
}

function build_qemu() {
    ./configure \
        --prefix=$PWD/build/sysroot \
        --target-list="arm-softmmu arm-linux-user" \
        --enable-debug \
        --enable-sdl \
        --enable-kvm \
        --enable-tools \
        --disable-curl

    make
    make install
}

function deploy_qemu() {
    echo $QEMU_FS_ORIGINAL
    QEMU_FS_ORIGINAL="$SCRIPTPATH/../build/sysroot"
    QEMU_ETC_ORIGINAL="$SCRIPTPATH/../etc"
    QEMU_TARGET="/home/fchen/Desktop/100ask/ubuntu-18.04_imx6ul_qemu_system/qemu"

    rm -rf $QEMU_TARGET/*

    cp -rf $QEMU_FS_ORIGINAL/* $QEMU_TARGET/
    cp -rf $QEMU_ETC_ORIGINAL $QEMU_TARGET/
}

build_clean
build_qemu
deploy_qemu
