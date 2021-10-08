FROM ubuntu:20.04

RUN apt-get update --yes && \
    apt-get upgrade --yes && \
    apt-get install --yes \
    build-essential && \
    rm -rf /var/lib/apt/lists/* && \
    rm -Rf /usr/share/doc && \
    rm -Rf /usr/share/man && \
    apt-get autoremove -y

ADD . /crfpp
WORKDIR /crfpp

RUN ./configure --build=${BUILD_ARCH} \
    make && \
    make install && \
    ldconfig
