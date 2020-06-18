#!/bin/bash

if [ "$(uname)" == "Darwin" ]; then
    # Mac OS X platform
    echo "Packing for MacOSX"
    jar -c -f openalpr4java.jar -e Main -C build .
    mv openalpr4java.jar ./build
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # GNU/Linux platform
    echo "Packing for Linux"
    JAVA_HOME=/srv/openalpr/linux-java/jdk-14.0.1
    export PATH=$PATH:$JAVA_HOME/bin
    jar -c -f openalpr4java.jar -e Main -C build .
    mv openalpr4java.jar ./build
fi
