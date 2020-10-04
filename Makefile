
run:
	./build/test_scanner

test: build
	mkdir build/tests_output
	for each test NN: ./build/test_scanner  <  tests/input/progNN.sl  >  build/tests_output/tokensNN.res
	for each test NN: diff build/tests_output/tokensNN.res tests/output/tokensNN.res

build:
	mkdir build
	flex -i -o build/scanner.c src/scanner.l;
	gcc -idirafter -std=c99 -pedantic -o build/test_scanner src/*.c src/*.h build/scanner.c

clean:
	rm -r build