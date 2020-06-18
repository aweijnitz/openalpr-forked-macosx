from ubuntu:18.04

# Install prerequisites
run apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential \
    cmake \
    curl \
    git \
    libcurl3-dev \
    libleptonica-dev \
    liblog4cplus-dev \
    libopencv-dev \
    libtesseract-dev \
    wget

# Copy all data
copy . /srv/openalpr

run mkdir -p /srv/javajdk
workdir /srv/openalpr/linux-java
run tar xvf openjdk-14.0.1_linux-x64_bin.tar.gz
run rm openjdk-14.0.1_linux-x64_bin.tar.gz
run export JAVA_HOME=/srv/openalpr/linux-java/jdk-14.0.1
run export PATH=$PATH:$JAVA_HOME/bin

# Setup the build directory
run mkdir -p /srv/openalpr/src/build
workdir /srv/openalpr/src/build

# Setup the compile environment
run cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc .. && \
    make -j2 && \
    make install

workdir /data

workdir /srv/openalpr/src/bindings/java
run ./clean.sh && ./make.sh && ./pack.sh && ./dist.sh
workdir /srv/openalpr/src/bindings/java/dist
entrypoint ["echo", "Linux java build located in /srv/openalpr/src/bindings/java/dist"]
