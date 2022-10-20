# Build Vars
IMAGENAME=jlim0930/troubleshoot
VERSION=latest

.DEFAULT_GOAL := all

build-x86:
	@docker build --platform linux/amd64 -t ${IMAGENAME}:${VERSION} .
push:
	@docker push ${IMAGENAME}:${VERSION} 
all: build-x86 push
