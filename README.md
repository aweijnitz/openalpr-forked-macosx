# Openalpr, forked and modified to run on modern MacOSX and Java v13

## About

This is a fork from the openalpr main repo, corresponding to OpenAlpr v2.3.0.
It has been modified to compile and run locally on a MacOSX Catalina, using OpenJDK v13 for the Java bindings.

For details about installation and general documentation on openalpr see the [original openalpr repository](https://github.com/openalpr/openalpr)

## Motivation

OpenAlpr is about the only available open source ALPR software around for free. Unfortunatley the project has fallen asleep and is not kept current. This goes for the Java and Javascript bindings especially.

## Changes from original

This repo is the regular openalpr source, but the Java bindings have been fixed and updated to compile and work with Java 13. The main difference is how header files are generated.

A minor memory leak has also been fixed in the C++ code for the Java binding.

## Build on MacOSX

**Pre requisites**

  brew install tesseract opencv@3 log4cplus
  brew cask install java

### Building openalpr

  buildOpenAlprOnMacOSX.sh
  # The alpr command line tool is now in src/build, along with various libraries

### Building the Java bindings

  cd src/bindings/java
  ./clean.sh && ./make.sh && ./pack.sh && ./verify.sh

## Development

See the following files 

- src/bindings/java/src/Main.java
- src/bindings/java/src/com/openalpr/jni/Alpr.java

Rebuild using `./clean.sh && ./make.sh && ./pack.sh` in `src/bindings/java`.



About openalpr
========

OpenALPR is an open source *Automatic License Plate Recognition* library written in C++ with bindings in C#, Java, Node.js, Go, and Python.  The library analyzes images and video streams to identify license plates.  The output is the text representation of any license plate characters.

Check out a live online demo here: http://www.openalpr.com/demo-image.html

License
-------

Affero GPLv3
http://www.gnu.org/licenses/agpl-3.0.html

Commercial-friendly licensing available.  Contact: info@openalpr.com
