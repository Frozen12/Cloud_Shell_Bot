FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive

RUN mkdir /app
WORKDIR /app
COPY . .

RUN chmod +x build && sh build/setup.sh

RUN pip3 install --no-cache-dir -r requirements.txt

#install megatools
#install required packages to compile source
#install dependencies for megatools experimental 1.11.0 (meson also)
# apt install meson ninja-build libglib2.0-dev libcurl4-openssl-dev build-essential libssl-dev checkinstall pkg-config cmake
# RUN git clone https://megous.com/git/megatools && cd megatools && meson b && ninja -C b && ninja -C b install && rm -rf ~/megatools
