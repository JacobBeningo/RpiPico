# Raspberry Pi RP2040 Docker Build Environment with Examples Link
The purpose of this project is to simlify toolchain setup for working with the Raspbery Pi Pico. The project contains a Dockerfile with all the instructions to setup the build environment. This readme will walk you through how to setup the container, clone the examples, and build the blinky application. 

## Step #1 - Clone the Repo

You'll want to clone the repo and initialize the submodules using the following git command:

```
git clone --recurse-submodules https://github.com/JacobBeningo/RpiPico.git
```

## Step #2 - Build the Docker Image

The Docker Image contains all the commands to setup the build toolchain and install the Raspberry Pi Pico SDK. There are two ways to build the image. From the RpiPico directory, you can use the Makefile by typing:
```
make docker-build
```

or you can manually type the docker build command:

```

docker build -t rpi/pico .
```
## Step #3 - Run the Docker Image

Next, we want to run the Docker image. The image uses a volume mount through a docker-compose file so that the host file system will also have any built files. Again, we can use the makefile to automatically issue our commands by using:
```
make docker-run
```

or we can manually issue the commands:

```
docker-compose up pico && \
docker run --rm -it --privileged -v "$(PWD):/home/dev" rpi/pico:latest bash
```

## Step #4 - Build the Raspberry Pi Pico Blinky Application

Performing a simple ls should reveal the repo main directory. Navigate into the examples directory:
```
cd pico-examples
```
Make a build directory and navigate into it as follows:
```
mkdir build
cd build
```
We now want to prepare cmake. Use the following command:
```
cmake ..
```
It may take a few minutes for the command to complete. Once it has, navigate into the blinky directory:
```
cd blink
```
We are now ready to build the blinky application! Simply execute make:
```
make
```
If everything went as planned, the blinky application is now built! You can verify this by running a listing and verifying that you have a blink.bin, blink.elf and blink.hex file.

## Step #5 - Exit the Docker Container

Exiting the Docker container is easy. Simply run:
```
exit
```

## Step #6 - Prepare the Raspberry Pi Pico

Hold down the BOOTSEL button on the Pico and connect the USB cable to a computer. The Pico will enumerate as a USB MSD device with a name similar to RPI-RP2

## Step #7 - Program the Raspberry Pi Pico

Copy the blink.uf2 and paste it into the Pico USB MSD drive. The MSD bootloader will copy the application to flash and the green LED on the board should start to blink. 
