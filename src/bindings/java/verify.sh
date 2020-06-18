LIBRARY_PATH=/Users/anders/IdeaProjects/openalpr/src/bindings/java:/Users/anders/IdeaProjects/openalpr/src/build/openalpr:$LD_LIBRARY_PATH
CONF_FILE=/Users/anders/IdeaProjects/openalpr/src/bindings/java/my.openalpr.conf
RUNTIME_DATA=/Users/anders/IdeaProjects/openalpr/runtime_data
java -Djava.library.path=${LD_LIBRARY_PATH} -jar ./build/openalpr4java.jar eu ${CONF_FILE} ${RUNTIME_DATA} ./testImage/h786poj.jpg
