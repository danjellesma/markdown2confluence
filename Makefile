# include env_make
NS = danjellz
VERSION ?= latest

REPO = markdown2confluence
NAME = markdown2confluence
# PORTS = -p 8080:80
VOLUMES = -v ${PWD}:/markdown

.PHONY: build push shell run start stop rm release

build:
	docker build -t $(NS)/$(REPO):$(VERSION) $(ARGS) .

push:
	docker push $(NS)/$(REPO):$(VERSION)

shell:
	docker run --rm --name $(NAME) -i -t $(PORTS) $(VOLUMES) $(ENV) $(NS)/$(REPO):$(VERSION) /sh

run:
	docker run -t --rm --name $(NAME) $(VOLUMES) $(NS)/$(REPO):$(VERSION)
#
# start:
# 	docker run -d --name $(NAME) $(VOLUMES) $(ENV) $(NS)/$(REPO):$(VERSION)
#
# stop:
# 	docker stop $(NAME)

rm:
	docker rm $(NAME)

release: build
	make push -e VERSION=$(VERSION)

default: build
