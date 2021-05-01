CHROMIUM_VERSION=86.0.4240.111-r0
NODE_VERSION=14.16
ALPINE_VERSION=3.13

IMAGE_NAME=hidori/chromium-node-alpine

.PHONY: build
build:
	docker build \
		--build-arg CHROMIUM_VERSION=$(CHROMIUM_VERSION) \
		--build-arg NODE_VERSION=$(NODE_VERSION) \
		--build-arg ALPINE_VERSION=$(ALPINE_VERSION) \
		-f ./Dockerfile --tag $(IMAGE_NAME) .

.PHONY: run
run:
	docker run -it --rm --privileged $(IMAGE_NAME)
