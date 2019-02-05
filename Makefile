.PHONY: clean
clean:
	go clean
	rm -f go-wasm

.PHONY: fmt
fmt:
	go fmt ./...

.PHONY: build
build:
	go build -o go-wasm

.PHONY: run
run: clean fmt build
	./go-wasm
	
