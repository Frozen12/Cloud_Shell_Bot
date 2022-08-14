FROM alpine:edge

RUN mkdir -p /app
WORKDIR /app
COPY . .

RUN apk add --update --no-cache --update-cache \
        bash python3 nodejs npm \
        curl wget git \
        nano \
        zip unzip p7zip \
        gcc libc-dev g++ python3-dev make


RUN apk add --no-cache \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
        py3-pip yarn


RUN npm install -g localtunnel
RUN pip3 install --no-cache-dir -r requirements.txt


# Install TGrclonebot
RUN git clone https://github.com/Frozen12/TelegramShellBot-Rclone.git && \
    cd TelegramShellBot-Rclone && \
    yarn install


# Install megatools
RUN apk add --update build-base libcurl curl-dev \
    asciidoc openssl-dev glib-dev \
    glib libtool automake autoconf meson \
    && git clone https://megous.com/git/megatools \
    && cd megatools && meson b \
    && ninja -C b && ninja -C b install && rm -rf ~/megatools




CMD ["bash", "start.sh"]
