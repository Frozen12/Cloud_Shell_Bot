#! /bin/bash

apk add --update --no-cache --update-cache \
        python3 nodejs npm \
        curl wget git \
        nano \
        zip unzip p7zip \
apk add --update --no-cache --update-cache \
        -X http://dl-cdn.alpinelinux.org/alpine/v3.14/community \
        rdfind py3-pip yarn


npm install -g localtunnel
pip3 install --no-cache-dir -r requirements.txt


# Install TGrclonebot
git clone https://github.com/Frozen12/TelegramShellBot-Rclone.git
cd TelegramShellBot-Rclone
yarn install

