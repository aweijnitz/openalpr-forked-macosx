#!/bin/sh

jar -c -f openalpr4java.jar -e Main -C build .
mv openalpr4java.jar ./build