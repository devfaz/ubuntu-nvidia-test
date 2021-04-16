FROM ubuntu:20.04

RUN apt-get -qq update && \
    distribution=ubuntu2004 && \
    apt-get -qq install wget gnupg software-properties-common && \
    wget "https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/cuda-$distribution.pin" -O /etc/apt/preferences.d/cuda-ubuntu1804 && \
    echo "deb http://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64 /" > /etc/apt/sources.list.d/cuda.list && \
    apt-key adv --fetch-keys "https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/7fa2af80.pub" && \
    apt-get -q update && \
    apt-get -qq install cuda && \
    apt-get -qq clean && \
    find /var/lib/apt/lists -type f -delete

