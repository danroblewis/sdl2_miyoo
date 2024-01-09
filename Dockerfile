FROM debian:buster

RUN apt-get update
RUN apt-get install build-essential make cmake wget autogen autoconf automake -y --no-install-recommends

WORKDIR /opt
RUN wget --no-check-certificate https://github.com/steward-fu/nds_miyoo/releases/download/assets/toolchain.tar.gz | tar zx

RUN mkdir /sdl2_miyoo
RUN ln -s /opt/mmiyoo /sdl2_miyoo
COPY Makefile /sdl2_miyoo/Makefile
COPY sdl2 /sdl2_miyoo/sdl2
COPY assets /sdl2_miyoo/assets
COPY trimui /sdl2_miyoo/trimui
COPY example /sdl2_miyoo/example
COPY swiftshader /sdl2_miyoo/swiftshader
COPY packages /sdl2_miyoo/packages

WORKDIR /sdl2_miyoo

RUN export PATH=/opt/mmiyoo/bin/:$PATH
RUN make config
RUN make sdl2
RUN make gpu
RUN make example

RUN mkdir -p /sample/libs
RUN cp swiftshader/build/*.so sdl2/build/.libs/libSDL2-2.0.so.0 /sample/libs/
RUN cp -f assets/mmiyoo/config.json assets/mmiyoo/launch.sh example/*.* example/Makefile /sample/


RUN mkdir /code
WORKDIR /code
