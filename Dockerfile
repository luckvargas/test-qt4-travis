FROM ubuntu:14.04

WORKDIR /home/build

#Setup
RUN apt-get update && apt-get install -y \
git \
build-essential \
openssl \
libssl-dev \ 
libsqlite3-dev \
qt4-default \
libqtwebkit4

# Build
# ARG CACHEBUST=1
RUN rm -rf test-qt4-travis && git clone https://github.com/luckvargas/test-qt4-travis
RUN cd test-qt4-travis && qmake test.pro && make && make install && ls

CMD QT_X11_NO_MITSHM=1 /opt/browser/bin/browser
