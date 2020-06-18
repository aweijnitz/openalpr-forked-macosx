#!/bin/sh
 
# openbsd 4.9
# gcc 4.2.1
# openjdk 1.7.0

# OPENALPR_INCLUDE_DIR=/storage/projects/alpr/src/openalpr/
# OPENALPR_LIB_DIR=/storage/projects/alpr/src/build/openalpr/
# JAVA_PATH=/usr/lib/jvm/java-1.7.0-openjdk-amd64

OPENALPR_INCLUDE_DIR=/Users/anders/IdeaProjects/openalpr/src/openalpr
OPENALPR_LIB_DIR=//Users/anders/IdeaProjects/openalpr/src/build/openalpr/
JAVA_PATH=/Library/Java/JavaVirtualMachines/openjdk-13.0.2.jdk/Contents/Home


export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:.:${OPENALPR_LIB_DIR}
# Compile java
# javac -Xlint:unchecked src/com/openalpr/jni/json/*.java src/com/openalpr/jni/*.java  src/Main.java
mkdir -p ./build
javac -Xlint:unchecked -d ./build -h ${OPENALPR_INCLUDE_DIR} src/com/openalpr/jni/json/*.java src/com/openalpr/jni/*.java  src/Main.java

# Create native header from Alpr java file
# javah -classpath src com.openalpr.jni.Alpr

# Compile/link native interface
g++ -Wall -L${OPENALPR_LIB_DIR} -I${JAVA_PATH}/include/ -I${JAVA_PATH}/include/darwin -I${OPENALPR_INCLUDE_DIR} -shared -fPIC -o libopenalprjni.so openalprjni.cpp -lopenalpr 

# Test
#java -classpath ./build Main