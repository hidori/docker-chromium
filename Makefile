CONTAINER_IMAGE = hidori/chromium-node-alpine

.PHONY: build
build:
	docker build -f ./Dockerfile --tag $(CONTAINER_IMAGE) .

.PHONY: run
run: build
	docker run -it --rm --privileged $(CONTAINER_IMAGE)
