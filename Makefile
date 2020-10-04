
run:
	./build/test_scanner

test: build
	mkdir build/tests_output
	@for f in $(shell ls tests/input/); do echo $${f} | cut -c 3-4; done

build:
	mkdir build
	flex -i -o build/scanner.c src/scanner.l;
	gcc -std=c99 -pedantic -I src/ -o build/test_scanner src/*.c src/*.h build/scanner.c

clean:
	rm -r build