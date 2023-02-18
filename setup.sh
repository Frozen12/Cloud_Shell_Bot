#! /bin/bash
apt update && apt upgrade -y && apt install -y software-properties-common && apt update && add-apt-repository universe && add-apt-repository multiverse
apt update && apt install -y --no-install-recommends \
        python3.8 python3-pip curl wget curl git \
        make python-is-python3 build-essential cmake \
        nano unzip \
        p7zip-full p7zip-rar


# install node v14.x including npm
curl -sL https://deb.nodesource.com/setup_14.x | bash -
apt install -y nodejs

rm -rf /var/lib/apt/lists/*
npm install -g localtunnel yarn
pip3 install --no-cache-dir -r requirements.txt

# install aria2c
# curl -Oaria2.deb https://tebi.com/7yhtraria2.deb


# Install TGrclonebot
git clone https://github.com/Frozen12/TelegramShellBot-Rclone.git
cd TelegramShellBot-Rclone
yarn install

