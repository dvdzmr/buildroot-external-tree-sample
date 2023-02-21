#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: ./setup.sh <board>"
    echo "Example: ./setup.sh raspberrypi3"
    exit 1
fi

cd ./buildroot

if [[ $1 == "menuconfig"* ]]; then
    make BR2_EXTERNAL=../external_tree menuconfig
else
    make BR2_EXTERNAL=../external_tree $1_defconfig
    BOARDDIR=$1
    export BOARDDIR
fi

echo "Do you want to execute 'make clean' before building? (y/N)"
read -r answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo "Cleaning..."
    make clean
    echo "Cleaned."
fi

echo "Building..."
make

# coping .img and .iso files from output/images to images folder. Don't worry about the error message if it cant find it for one of them.
cp ./output/images/*.img ../image/$BOARDDIR.img
cp ./output/images/*.iso ../image/$BOARDDIR.iso