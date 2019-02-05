# .PHONY: setup
# setup:
# 	if [goexec -e 0]; then 
# 		go get -u github.com/shurcooL/goexec
# 		go install github.com/shurcooL/goexec
# 	fi

.PHONY: clean
clean:
	go clean
	rm -f go-wasm
	rm -f main.wasm

.PHONY: fmt
fmt:
	go fmt ./...

.PHONY: build
build:
	go build -o go-wasm

.PHONY: run
run: clean fmt build
	./go-wasm

.PHONY: wasm-build
wasm-build:
	GOOS=js GOARCH=wasm go build -o ./static/main.wasm

.PHONY: wasm-copy
wasm-copy:
	cp $$(go env GOROOT)/misc/wasm/wasm_exec.js ./static/wasm_exec.js

.PHONY: run-webserver
run-webserver:
	goexec 'http.ListenAndServe(":8284", http.FileServer(http.Dir(".")))'
