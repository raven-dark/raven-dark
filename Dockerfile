FROM ubuntu:trusty

RUN apt-get update && apt-get install -y \
  g++ \
  libzmq3-dev \
  libzmq3-dbg \
  libzmq3 \
  make \
  python \
  software-properties-common \
  curl \
  build-essential \
  libssl-dev \
  wget \
  libtool \
  autotools-dev \
  automake \
  pkg-config \
  libevent-dev \
  bsdmainutils \
  git

RUN add-apt-repository ppa:bitcoin/bitcoin -y
RUN apt-get update
RUN apt-get install -y libdb4.8-dev libdb4.8++-dev

RUN apt-get install -y \
  libboost-system-dev \
  libboost-filesystem-dev \
  libboost-chrono-dev \
  libboost-program-options-dev \
  libboost-test-dev \
  libboost-thread-dev

ENV VERSION=0.3.2

WORKDIR /ravendark
COPY . .

RUN ./autogen.sh && \
 ./configure --without-gui && make -j4

RUN ln -sf /ravendark/src/ravendarkd /usr/bin/ravendarkd
RUN ln -sf /ravendark/src/ravendark-cli /usr/bin/ravendark-cli


WORKDIR /ravendark/src
RUN tar zcvf raven-dark-${VERSION}-ubuntu.tar.gz ravendarkd ravendark-cli
RUN mkdir -p /root/compressed
RUN mv raven-dark-${VERSION}-ubuntu.tar.gz /root/compressed

EXPOSE 6666 6665

VOLUME /root/.ravendarkcore

# CMD ravendarkd
CMD tail -f /dev/null
