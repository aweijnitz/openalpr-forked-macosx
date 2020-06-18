#!/bin/bash
mkdir -p ./dist

if [ "$(uname)" == "Darwin" ]; then
    # Mac OS X platform
    echo "Disting for MacOSX"
    cp ../../build/openalpr/libopenalpr.2.dylib ./dist/
    cp ./libopenalprjni.so ./dist
    cp build/openalpr4java.jar ./dist
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # GNU/Linux platform
    echo "Disting for Linux"
    cp ../../build/openalpr/libopenalpr.so ./dist/
    cp ./libopenalprjni.so ./dist
    cp build/openalpr4java.jar ./dist
fi




