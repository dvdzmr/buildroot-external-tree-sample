#!/bin/bash

cd ./buildroot

echo "Do you want to execute 'make clean' before building? (y/n)"
read -r answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo "Cleaning..."
    make clean
    echo "Cleaned."
fi

echo "Building..."

make

# coping .img and .iso files from output/images to images folder.

cp ./output/images/*.img ../images
cp ./output/images/*.iso ../images
