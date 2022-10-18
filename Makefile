TAG := latest
ifndef TAG
$(error The TAG variable is missing.)
endif
 
ACCOUNT := beanna
SERVICE := docker-python-learning
IMAGE := $(ACCOUNT)/$(SERVICE)
 
 
build:
	$(info Make: Building "$(TAG)" tagged images.)
	@docker build -t $(IMAGE):$(TAG) -f Dockerfile .
	@make -s tag
	@make -s clean
 
tag:
	$(info Make: Tagging image with "$(TAG)".)
	@docker tag $(IMAGE):latest $(IMAGE):$(TAG)

start:
	$(info Make: Starting "$(TAG)" tagged container.)
	@docker run --init -p 3000:5000 -dit --name $(SERVICE) $(IMAGE):$(TAG)

shell:
	$(info Make: Entering "$(TAG)" docker container via interactive shell)
	@docker exec -it $(SERVICE) /bin/bash

stop:
	$(info Make: Stopping "$(TAG)" tagged container.)
	@docker stop $(SERVICE)
	@docker rm $(SERVICE)
 
restart:
	$(info Make: Restarting "$(TAG)" tagged container.)
	@make -s stop
	@make -s start
 
push:
	$(info Make: Pushing "$(TAG)" tagged image.)
	@docker push $(IMAGE):$(TAG)
 
pull:
	$(info Make: Pulling "$(TAG)" tagged image.)
	@docker pull $(IMAGE):$(TAG)
 
clean:
	@docker system prune --volumes --force
 
login:
	$(info Make: Login to Docker Hub.)
	@docker login -u $(DOCKER_USER) -p $(DOCKER_PASS)