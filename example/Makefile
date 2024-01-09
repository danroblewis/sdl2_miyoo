export CROSS=/opt/mmiyoo/bin/arm-linux-gnueabihf-
export CC=${CROSS}gcc
export AR=${CROSS}ar
export AS=${CROSS}as
export LD=${CROSS}ld
export CXX=${CROSS}g++
export HOST=arm-linux

MOD      = mmiyoo


.PHONY: build
build:
	mkdir -p libs
	cp /sdl2_miyoo/assets/mmiyoo/config.json /sdl2_miyoo/assets/mmiyoo/launch.sh .
	cp /sdl2_miyoo/swiftshader/build/*.so libs/
	cp /sdl2_miyoo/sdl2/build/.libs/libSDL2-2.0.so.0 libs/
	$(CC) main.c -I/opt/mmiyoo/arm-buildroot-linux-gnueabihf/sysroot/usr/include/SDL2 -lSDL2 -lSDL2_mixer -lSDL2_image -lSDL2_gfx -lSDL2_ttf -o game

