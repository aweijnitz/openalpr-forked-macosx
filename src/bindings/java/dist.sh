#!/bin/sh
mkdir -p ./dist
cp ../../build/openalpr/libopenalpr.2.dylib ./dist/
cp ./libopenalprjni.so ./dist
cp build/openalpr4java.jar ./dist

