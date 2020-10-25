SHELL := bash

run:
	./build/main

test: build
	./runtests.sh

build:
	mkdir build
	flex -i -o build/scanner.c src/scanner.l;
	gcc -std=c99 -pedantic -I src/ -o build/main src/*.c src/*.h build/scanner.c

clean:
	rm -rf build