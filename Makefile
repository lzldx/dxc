# This Makefile is meant to be used by people that do not usually work
# with Go source code. If you know what GOPATH is then you probably
# don't need to bother with make.

.PHONY: gdxc android ios gdxc-cross evm all test clean
.PHONY: gdxc-linux gdxc-linux-386 gdxc-linux-amd64 gdxc-linux-mips64 gdxc-linux-mips64le
.PHONY: gdxc-linux-arm gdxc-linux-arm-5 gdxc-linux-arm-6 gdxc-linux-arm-7 gdxc-linux-arm64
.PHONY: gdxc-darwin gdxc-darwin-386 gdxc-darwin-amd64
.PHONY: gdxc-windows gdxc-windows-386 gdxc-windows-amd64

GOBIN = ./build/bin
GO ?= latest
GORUN = env GO111MODULE=on go run

gdxc:
	$(GORUN) build/ci.go install ./cmd/gdxc
	@echo "Done building."
	@echo "Run \"$(GOBIN)/gdxc\" to launch gdxc."

all:
	$(GORUN) build/ci.go install

android:
	$(GORUN) build/ci.go aar --local
	@echo "Done building."
	@echo "Import \"$(GOBIN)/gdxc.aar\" to use the library."
	@echo "Import \"$(GOBIN)/gdxc-sources.jar\" to add javadocs"
	@echo "For more info see https://stackoverflow.com/questions/20994336/android-studio-how-to-attach-javadoc"

ios:
	$(GORUN) build/ci.go xcode --local
	@echo "Done building."
	@echo "Import \"$(GOBIN)/Geth.framework\" to use the library."

test: all
	$(GORUN) build/ci.go test

lint: ## Run linters.
	$(GORUN) build/ci.go lint

clean:
	env GO111MODULE=on go clean -cache
	rm -fr build/_workspace/pkg/ $(GOBIN)/*

# The devtools target installs tools required for 'go generate'.
# You need to put $GOBIN (or $GOPATH/bin) in your PATH to use 'go generate'.

devtools:
	env GOBIN= go install golang.org/x/tools/cmd/stringer@latest
	env GOBIN= go install github.com/kevinburke/go-bindata/go-bindata@latest
	env GOBIN= go install github.com/fjl/gencodec@latest
	env GOBIN= go install github.com/golang/protobuf/protoc-gen-go@latest
	env GOBIN= go install ./cmd/abigen
	@type "solc" 2> /dev/null || echo 'Please install solc'
	@type "protoc" 2> /dev/null || echo 'Please install protoc'

# Cross Compilation Targets (xgo)

gdxc-cross: gdxc-linux gdxc-darwin gdxc-windows gdxc-android gdxc-ios
	@echo "Full cross compilation done:"
	@ls -ld $(GOBIN)/gdxc-*

gdxc-linux: gdxc-linux-386 gdxc-linux-amd64 gdxc-linux-arm gdxc-linux-mips64 gdxc-linux-mips64le
	@echo "Linux cross compilation done:"
	@ls -ld $(GOBIN)/gdxc-linux-*

gdxc-linux-386:
	$(GORUN) build/ci.go xgo -- --go=$(GO) --targets=linux/386 -v ./cmd/gdxc
	@echo "Linux 386 cross compilation done:"
	@ls -ld $(GOBIN)/gdxc-linux-* | grep 386

gdxc-linux-amd64:
	$(GORUN) build/ci.go xgo -- --go=$(GO) --targets=linux/amd64 -v ./cmd/gdxc
	@echo "Linux amd64 cross compilation done:"
	@ls -ld $(GOBIN)/gdxc-linux-* | grep amd64

gdxc-linux-arm: gdxc-linux-arm-5 gdxc-linux-arm-6 gdxc-linux-arm-7 gdxc-linux-arm64
	@echo "Linux ARM cross compilation done:"
	@ls -ld $(GOBIN)/gdxc-linux-* | grep arm

gdxc-linux-arm-5:
	$(GORUN) build/ci.go xgo -- --go=$(GO) --targets=linux/arm-5 -v ./cmd/gdxc
	@echo "Linux ARMv5 cross compilation done:"
	@ls -ld $(GOBIN)/gdxc-linux-* | grep arm-5

gdxc-linux-arm-6:
	$(GORUN) build/ci.go xgo -- --go=$(GO) --targets=linux/arm-6 -v ./cmd/gdxc
	@echo "Linux ARMv6 cross compilation done:"
	@ls -ld $(GOBIN)/gdxc-linux-* | grep arm-6

gdxc-linux-arm-7:
	$(GORUN) build/ci.go xgo -- --go=$(GO) --targets=linux/arm-7 -v ./cmd/gdxc
	@echo "Linux ARMv7 cross compilation done:"
	@ls -ld $(GOBIN)/gdxc-linux-* | grep arm-7

gdxc-linux-arm64:
	$(GORUN) build/ci.go xgo -- --go=$(GO) --targets=linux/arm64 -v ./cmd/gdxc
	@echo "Linux ARM64 cross compilation done:"
	@ls -ld $(GOBIN)/gdxc-linux-* | grep arm64

gdxc-linux-mips:
	$(GORUN) build/ci.go xgo -- --go=$(GO) --targets=linux/mips --ldflags '-extldflags "-static"' -v ./cmd/gdxc
	@echo "Linux MIPS cross compilation done:"
	@ls -ld $(GOBIN)/gdxc-linux-* | grep mips

gdxc-linux-mipsle:
	$(GORUN) build/ci.go xgo -- --go=$(GO) --targets=linux/mipsle --ldflags '-extldflags "-static"' -v ./cmd/gdxc
	@echo "Linux MIPSle cross compilation done:"
	@ls -ld $(GOBIN)/gdxc-linux-* | grep mipsle

gdxc-linux-mips64:
	$(GORUN) build/ci.go xgo -- --go=$(GO) --targets=linux/mips64 --ldflags '-extldflags "-static"' -v ./cmd/gdxc
	@echo "Linux MIPS64 cross compilation done:"
	@ls -ld $(GOBIN)/gdxc-linux-* | grep mips64

gdxc-linux-mips64le:
	$(GORUN) build/ci.go xgo -- --go=$(GO) --targets=linux/mips64le --ldflags '-extldflags "-static"' -v ./cmd/gdxc
	@echo "Linux MIPS64le cross compilation done:"
	@ls -ld $(GOBIN)/gdxc-linux-* | grep mips64le

gdxc-darwin: gdxc-darwin-386 gdxc-darwin-amd64
	@echo "Darwin cross compilation done:"
	@ls -ld $(GOBIN)/gdxc-darwin-*

gdxc-darwin-386:
	$(GORUN) build/ci.go xgo -- --go=$(GO) --targets=darwin/386 -v ./cmd/gdxc
	@echo "Darwin 386 cross compilation done:"
	@ls -ld $(GOBIN)/gdxc-darwin-* | grep 386

gdxc-darwin-amd64:
	$(GORUN) build/ci.go xgo -- --go=$(GO) --targets=darwin/amd64 -v ./cmd/gdxc
	@echo "Darwin amd64 cross compilation done:"
	@ls -ld $(GOBIN)/gdxc-darwin-* | grep amd64

gdxc-windows: gdxc-windows-386 gdxc-windows-amd64
	@echo "Windows cross compilation done:"
	@ls -ld $(GOBIN)/gdxc-windows-*

gdxc-windows-386:
	$(GORUN) build/ci.go xgo -- --go=$(GO) --targets=windows/386 -v ./cmd/gdxc
	@echo "Windows 386 cross compilation done:"
	@ls -ld $(GOBIN)/gdxc-windows-* | grep 386

gdxc-windows-amd64:
	$(GORUN) build/ci.go xgo -- --go=$(GO) --targets=windows/amd64 -v ./cmd/gdxc
	@echo "Windows amd64 cross compilation done:"
	@ls -ld $(GOBIN)/gdxc-windows-* | grep amd64
