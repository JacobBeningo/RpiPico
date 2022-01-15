## Make driven command interface to simplifiy RPI Pico development in Docker

.PHONY: docker-build docker-run 

## Build the docker image
docker-build: 
	docker build -t rpi/pico .

## Mount host file system and run the docker image
docker-run: 
	docker-compose up pico && \
	docker run --rm -it --privileged -v "$(PWD):/home/dev" rpi/pico:latest bash