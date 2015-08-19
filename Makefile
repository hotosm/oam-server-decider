DOCKER_IMAGE = oam/server-decider:latest

all: decider

decider:
	@docker build -f ./Dockerfile -t $(DOCKER_IMAGE) .

start: decider
	@docker run \
		--name oam-server-decider \
		--volume $(PWD)/decider:/app/decider \
		$(DOCKER_IMAGE) start

clean:
	@docker kill oam-server-decider >> /dev/null 2>&1 || true
	@docker rm oam-server-decider >> /dev/null 2>&1 || true

.PHONY: all decider start clean
