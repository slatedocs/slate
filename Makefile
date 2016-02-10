.PHONY: pull up start all

all:
	@echo "Commands to build app using docker-compose"
	@echo "Plain commands default to dev environment"
	@echo "make build"
	@echo "make up"

build:
	docker-compose build

up:
	docker-compose up
