FROM alpine:edge

RUN mkdir -p /app
WORKDIR /app
COPY . .

RUN apk add --update --no-cache --update-cache \
        bash python3 nodejs npm \
        curl wget git \
        nano \
        zip unzip p7zip \
        gcc libc-dev g++ python3-dev make \


RUN apk add --no-cache \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
        py3-pip yarn cadaver


RUN pip3 install --no-cache-dir -r requirements.txt


# Install TGrclonebot
RUN git clone https://github.com/Frozen12/TelegramShellBot-Rclone.git && \
    cd TelegramShellBot-Rclone && \
    yarn install

# Alpine image dependencies are below
# bash gcc libc-dev g++ python3-dev make ( python3 module : pycryptodomex )

CMD ["bash", "start.sh"]
