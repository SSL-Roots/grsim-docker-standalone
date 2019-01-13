FROM uphy/ubuntu-desktop-jp

ENV DISPLAY :0.0

RUN apt-get update && apt-get install -y \
git \
build-essential \
cmake \
libqt4-dev \
libgl1-mesa-dev \
libglu1-mesa-dev \
libprotobuf-dev \
protobuf-compiler \
libode-dev \
libboost-dev \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

RUN cd /tmp && \
git clone https://github.com/szi/vartypes.git && \
cd vartypes && \
mkdir build && \
cd build && \
cmake .. && \
make && \
make install

RUN git clone https://github.com/mani-monaj/grSim.git && \
cd grSim && \
mkdir build && \
cd build && \
cmake .. && \
make

CMD ["/grSim/bin/grsim"]
