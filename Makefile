# Build Vars
IMAGENAME=jlim0930/troubleshoot
VERSION=latest

.DEFAULT_GOAL := all

build-x86:
	@docker build --platform linux/amd64 -t ${IMAGENAME}:${VERSION} .
build-arm64:
	@docker build --platform linux/arm64 -t ${IMAGENAME}:${VERSION} .
build-all:
	@docker buildx build --platform linux/amd64,linux/arm64 --output "type=image,push=false" --file ./Dockerfile .
push:
	@docker push ${IMAGENAME}:${VERSION} 
all: build-all push
