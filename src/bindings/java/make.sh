#!/bin/bash
mkdir -p ./build

if [ "$(uname)" == "Darwin" ]; then
    # Mac OS X platform
    echo "Building for MacOSX"
    OPENALPR_INCLUDE_DIR=/Users/anders/IdeaProjects/openalpr/src/openalpr/
    OPENALPR_LIB_DIR=/Users/anders/IdeaProjects/openalpr/src/build/openalpr/
    JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-13.0.2.jdk/Contents/Home
    JNI_PLATFORM=${JAVA_HOME}/include/darwin
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # GNU/Linux platform
    echo "Building for Linux"
    OPENALPR_INCLUDE_DIR=/srv/openalpr/src/openalpr/
    OPENALPR_LIB_DIR=/srv/openalpr/src/build/openalpr/
    JAVA_HOME=/srv/openalpr/linux-java/jdk-14.0.1
    JNI_PLATFORM=${JAVA_HOME}/include/linux
    export PATH=$PATH:$JAVA_HOME/bin
fi

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:.:${OPENALPR_LIB_DIR}   

# Compile java
javac -Xlint:unchecked -d ./build -h ${OPENALPR_INCLUDE_DIR} src/com/openalpr/jni/json/*.java src/com/openalpr/jni/*.java  src/Main.java

# Compile/link native interface
g++ -Wall -L${OPENALPR_LIB_DIR} -I${JAVA_HOME}/include/ -I${JNI_PLATFORM} -I${OPENALPR_INCLUDE_DIR} -shared -fPIC -o libopenalprjni.so openalprjni.cpp -lopenalpr 

jar -c -f openalpr4java.jar -e Main -C build .
mv openalpr4java.jar ./build
