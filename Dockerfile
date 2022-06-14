FROM theorangeone/rclone-mount:latest
# This image is based on alpine:3.14

RUN mkdir -p /app
WORKDIR /app
COPY . .



RUN apk add --update --no-cache --update-cache \
        python3 nodejs npm \
        curl wget git \
        nano \
        zip unzip p7zip \
        py-crypto 
RUN apk add --update --no-cache --update-cache \
        -X http://dl-cdn.alpinelinux.org/alpine/v3.14/community \
        rdfind py3-pip yarn


RUN npm install -g localtunnel
RUN pip3 install --no-cache-dir -r requirements.txt


# Install TGrclonebot
RUN git clone https://github.com/Frozen12/TelegramShellBot-Rclone.git && \
    cd TelegramShellBot-Rclone && \
    yarn install


CMD ["bash", "start.sh"]
