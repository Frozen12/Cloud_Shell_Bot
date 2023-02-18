#!/bin/bash

# Install rclone static binary
wget -q https://downloads.rclone.org/v1.61.1/rclone-v1.61.1-linux-amd64.zip
unzip -q rclone-*-linux-amd64.zip
export PATH=$PWD/rclone-v1.61.1-linux-amd64:$PATH
echo "Rclone installed successfully"
# remove junk
rm -rf rclone-*-linux-amd64.zip *.txt *yml *.md

# Create rclone.conf file from base64
if [[ -n $RCLONE_CONFIG_BASE64 ]]; then
	echo "Rclone config in BASE64 Format detected"
	echo "[DRIVE]" > rclone.conf
    mkdir -p /root/.config/rclone
	echo "$(echo $RCLONE_CONFIG_BASE64|base64 -d)" >> /root/.config/rclone/rclone.conf
fi

# fetch rclone.conf from url

if [[ -n $RCLONE_CONFIG_URL ]]; then
	echo "Rclone config file url detected. Fetching rclone.conf . . ."
	mkdir -p /root/.config/rclone
    curl -o/root/.config/rclone/rclone.conf "$RCLONE_CONFIG_URL"

fi

# echo " Rclone Config File loaded successfully "


# Set bot token & owner ID

if [[ -n $BOT_TOKEN && -n $OWNER_ID ]]; then
	echo "Bot token and owner ID detected"
	cd TelegramShellBot-Rclone
        python3 config.py
fi

echo "SETUP COMPLETED"

# rclone serve webdav
rclone serve webdav /app --addr localhost:9090 --user "meshpotato" --pass "strong-fest-rat-Nest6" &
echo "rclone serving webdav /app on localhost:9090 --user '"meshpotato"' -pass '"strong-fest-rat-Nest6"'"
# start bot
echo "starting the bot"
npm start
