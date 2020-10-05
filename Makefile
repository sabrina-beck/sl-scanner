SHELL := bash

run:
	./build/test_scanner

test: build
	mkdir build/tests
	./runtests.sh

build:
	mkdir build
	flex -i -o build/scanner.c src/scanner.l;
	gcc -std=c99 -pedantic -I src/ -o build/test_scanner src/*.c src/*.h build/scanner.c

clean:
	rm -r build