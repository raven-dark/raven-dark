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

COPY . /ravendark
WORKDIR /ravendark
RUN chmod -R 777 .

RUN ./autogen.sh && \
 ./configure --without-gui && make

RUN ln -sf /ravendark/src/ravendarkd /usr/bin/ravendarkd
RUN ln -sf /ravendark/src/ravendark-cli /usr/bin/ravendark-cli

EXPOSE 6666 6665

VOLUME /root/.ravendarkcore

CMD ravendarkd
