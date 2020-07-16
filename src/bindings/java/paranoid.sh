CONF_FILE=/Users/anders/IdeaProjects/openalpr/src/bindings/java/my.openalpr.conf
RUNTIME_DATA=/Users/anders/IdeaProjects/openalpr/runtime_data

export OPENALPR_LOCATION_DYLIB="/Users/anders/IdeaProjects/nummerschilder/plate-recogniser-service/openalpr-lib/macosx/libopenalpr.2.dylib"
export OPENALPR_LOCATION_JNI="/Users/anders/IdeaProjects/nummerschilder/plate-recogniser-service/openalpr-lib/macosx/libopenalprjni.so"
java -jar ./build/openalpr4java.jar eu ${CONF_FILE} ${RUNTIME_DATA} /Users/anders/IdeaProjects/nummerschilder/plate-recogniser-service/testImage/h786poj.jpg
