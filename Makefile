.PHONY: clean
clean:
	go clean
	rm -f go-wasm


.PHONY: build
build:
	go build -o go-wasm

.PHONY: run
run: clean build
	./go-wasm
	
