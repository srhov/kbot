VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
APP_NAME := kbot
DOCKER_IMAGE := kbot-test
PLATFORMS := linux/amd64 linux/arm64 darwin/amd64 darwin/arm64 windows/amd64
BUILD_DIR := build

format:
	gofmt -s -w ./

lint:
	golint

test:
	go test -v

build: format
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -v -o kbot -ldflags "-X="kbot/cmd.appVersion=${VERSION}

# Platform targets
linux:
	GOOS=linux GOARCH=amd64 go build -o $(BUILD_DIR)/$(APP_NAME)-linux

arm:
	GOOS=linux GOARCH=arm64 go build -o $(BUILD_DIR)/$(APP_NAME)-arm

macos:
	GOOS=darwin GOARCH=amd64 go build -o $(BUILD_DIR)/$(APP_NAME)-macos

windows:
	GOOS=windows GOARCH=amd64 go build -o $(BUILD_DIR)/$(APP_NAME)-windows.exe

# Build docker image
image:
	docker build -t $(DOCKER_IMAGE) .

# Clean build artifacts and Docker image
clean:
	rm -rf $(BUILD_DIR)
	-docker rmi $(DOCKER_IMAGE) || true