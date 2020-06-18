rm -rf ./linux-java-build
mkdir -p ./linux-java-build
docker run openalpr4java:latest
docker cp `docker ps -q -l`:/srv/openalpr/src/bindings/java/dist/libopenalpr.so ./linux-java-build/
docker cp `docker ps -q -l`:/srv/openalpr/src/bindings/java/dist/libopenalprjni.so ./linux-java-build/
docker cp `docker ps -q -l`:/srv/openalpr/src/bindings/java/dist/openalpr4java.jar ./linux-java-build/
echo "Linux build of openalpr with java bindings coped to ./linux-java-build"