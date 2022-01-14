# Raspberry Pi RP2040 Build Environment with Examples Link
The purpose of this project is to simlify toolchain setup for working with the Raspbery Pi Pico. The project contains a Dockerfile with all the instructions to setup the build environment. This readme will walk you through how to setup the container, clone the examples, and build the blinky application. 

## Step #1 - Clone the Repo

You'll want to clone the repo and initialize the submodules using the following git command:

```
git clone --recurse-submodules https://github.com/JacobBeningo/RpiPico.git
```

## Step #2 - Build the Docker Image

The Docker Image contains all the commands to setup the build toolchain and install the Raspberry Pi Pico SDK. After step #1, execute the following two commands to move into the project folder and build the Docker Image:

```
cd RpiPico

docker build -t rpi/pico .
```
## Step #3 - Run the Docker Image

Next, we can run the Docker image using the following command:

```
docker run --rm -it --privileged -v "$(PWD):/home/dev" rpi/pico
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
