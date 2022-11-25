GOPATH:=$(shell go env GOPATH)

all:
		protoc -I/usr/local/include -I. \
			-I${GOPATH}/pkg/mod \
			-I${GOPATH}/pkg/mod/github.com/grpc-ecosystem/grpc-gateway@v1.16.0/third_party/googleapis \
			-I${GOPATH}/pkg/mod/github.com/grpc-ecosystem/grpc-gateway@v1.16.0 \
			-I${GOPATH}/pkg/mod/github.com/grpc-ecosystem/grpc-gateway/v2@v2.14.0 \
			-I${GOPATH}/pkg/mod/gitlab.mapcard.pro/external-map-team/api-proto@v1.0.31 \
			--grpc-gateway_out=logtostderr=true:. \
			--go-grpc_out=require_unimplemented_servers=false,paths=source_relative:. \
			--go_out=paths=source_relative:. \
			./payment/api/*.proto
