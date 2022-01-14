FROM ubuntu:latest

ENV REFRESHED_AT 2022-01-14

# Add timezone info and that we are not interactive
# so that cmake installs without prompts. 
ENV TZ=America/Chicago
ENV DEBIAN_FRONTEND=noninteractive

# Download Linux support tools
RUN apt-get update && \
    apt-get clean &&  \
    apt-get install -y \
        build-essential \
        wget \
        curl \
        git  \
        python3

# Set the dev directory
WORKDIR /home/dev

# Download and install RP2040 Toolchains
RUN apt-get -y install cmake \
        gcc-arm-none-eabi \
        libnewlib-arm-none-eabi 

# Clone and setup the RP2040 SDK
RUN git clone https://github.com/raspberrypi/pico-sdk /home/sdk/pico-sdk && \
     cd /home/sdk/pico-sdk && \
    git submodule update --init && \
     cd /home/dev

ENV PICO_SDK_PATH=/home/sdk/pico-sdk

