CONF_FILE=/Users/anders/IdeaProjects/openalpr/src/bindings/java/my.openalpr.conf
RUNTIME_DATA=/Users/anders/IdeaProjects/openalpr/runtime_data

export OPENALPR_LOCATION_DYLIB="/Users/anders/IdeaProjects/openalpr/src/build/openalpr/libopenalpr.2.dylib"
export OPENALPR_LOCATION_JNI="/Users/anders/IdeaProjects/openalpr/src/bindings/java/libopenalprjni.so"
java -jar ./build/openalpr4java.jar eu ${CONF_FILE} ${RUNTIME_DATA} ./testImage/h786poj.jpg
