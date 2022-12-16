GOPATH:=$(shell go env GOPATH)

.PHONY: init
init:
	@go get -u google.golang.org/protobuf/proto
	@go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
	@go install github.com/go-micro/generator/cmd/protoc-gen-micro@latest

.PHONY: proto
proto:
	@protoc --proto_path=. --micro_out=. --go_out=:. proto/shippy-service-consignment.proto

.PHONY: update
update:
	@go get -u

.PHONY: tidy
tidy:
	@go mod tidy

.PHONY: build
build:
	@go build -o shippy-service *.go

.PHONY: test
test:
	@go test -v ./... -cover

.PHONY: docker
docker:
# GOOS=linux GOARCH=amd64 go build
	docker build -t shippy-service-consignment:latest .

.PHONY: run
run:
	docker run -p 50051:50051 shippy-service-consignment