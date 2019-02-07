.PHONY: build
build:
	docker build -t tier/documentation -f Dockerfile .
	docker run -it -p 80:80 tier/documentation
