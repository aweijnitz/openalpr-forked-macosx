#!/bin/bash

#brew install tesseract opencv@3 log4cplus
#brew cask install java

cd ./src ; mkdir build; cd build
export OpenCV_DIR="/usr/local/opt/opencv@3/"
cmake .. -DCMAKE_INSTALL_PREFIX:PATH=/usr/local -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc -DCMAKE_MACOSX_RPATH=true -DCMAKE_CXX_FLAGS="-std=c++11"
#       cf. https://github.com/openalpr/openalpr/issues/762
make
#make install