NAME = poetry-3218
DOCKER_RUN_ARGS = --rm -it \
	-u $(shell id -u):$(shell id -g) \
	-v $(PWD):/local \
	-v /etc/passwd:/etc/passwd:ro \
	-v /etc/group:/etc/group:ro \
	-w /local \
	-e HOME=/tmp/home \
	--name $(NAME) \
	$(NAME)

.PHONY: all
all: help

.PHONY: help
help:
	@echo "*** Poetry issue 3218 ***"
	@echo ""
	@echo "help  - This help text"
	@echo "build - Build docker image"
	@echo "shell - Shell into docker container"
	@echo "issue - Reproduce issue"

.PHONY: build
build: .meta-build
.meta-build: Dockerfile
	docker build --tag $(NAME) .
	touch $@

.PHONY: shell
shell: .meta-build
	docker run $(DOCKER_RUN_ARGS)

.PHONY: issue
issue: .meta-build
	docker run $(DOCKER_RUN_ARGS) reproduce_issue.sh
