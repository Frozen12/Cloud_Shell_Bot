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

# megaCMD


RUN apk add --repository https://dl-cdn.alpinelinux.org/alpine/edge/testing --update --no-cache \
    c-ares \
    crypto++ \
    libcurl \
    libtool \
    libuv \
    libpcrecpp \
    libsodium \
    sqlite-libs \
    sqlite \
    pcre \
    readline \
    freeimage \
    zlib \
    \
    && apk add --repository https://dl-cdn.alpinelinux.org/alpine/edge/testing --update --no-cache --virtual .build-deps \
    autoconf \
    automake \
    c-ares-dev \
    crypto++-dev \
    curl \
    curl-dev \
    file \
    g++ \
    gcc \
    git \
    sqlite-dev \
    pcre-dev \
    libc-dev \
    libffi-dev \
    libressl-dev \
    libsodium \
    libsodium-dev \
    libuv-dev \
    make \
    openssl \
    openssl-dev \
    readline-dev \
    zlib-dev \
    freeimage-dev \
    \
    && git clone https://github.com/meganz/MEGAcmd.git /opt/MEGAcmd \
    && cd /opt/MEGAcmd \
    && git submodule update --init --recursive \
    && sh autogen.sh \
    && ./configure \
    && make -j $(nproc) \
    && make install \
    && cd / \
    && rm -rf /opt/MEGAcmd \
    \
    && apk del .build-deps


CMD ["bash", "start.sh"]
