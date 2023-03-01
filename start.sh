#!/bin/bash

# Install rclone static binary
wget -q https://downloads.rclone.org/v1.61.1/rclone-v1.61.1-linux-amd64.zip
unzip -q rclone-v1.61.1-linux-amd64.zip
export PATH=$PWD/rclone-v1.61.1-linux-amd64:$PATH
echo "Rclone installed successfully"

# remove junk
rm -rf rclone-*-linux-amd64.zip *.txt *yml *.md

# Create rclone.conf file from base64
if [[ -n $RCLONE_CONFIG_BASE64 ]]; then
	echo "Rclone config in BASE64 Format detected"
        mkdir -p /app/.config/rclone
	echo "$(echo $RCLONE_CONFIG_BASE64|base64 -d)" > /app/.config/rclone/rclone.conf

# fetch rclone.conf from url
elif [[ -n $RCLONE_CONFIG_URL ]]; then
	echo "Rclone config file url detected. Fetching rclone.conf . . ."
	mkdir -p /app/.config/rclone
    curl -o/app/.config/rclone/rclone.conf "$RCLONE_CONFIG_URL" > /dev/null 2>&1
fi

# Rclone Service Account
if [[ -n $RCLONE_SA_ZIP_URL ]]; then
        echo "Rclone SA zip url detected. Fetching zip file . . ."
	mkdir -p /app/.config/rclone
        wget -q -O /app/.config/rclone/sa-accounts.zip "$RCLONE_SA_ZIP_URL" > /dev/null 2>&1
        unzip -qq -o /app/.config/rclone/sa-accounts.zip -d /app/.config/rclone/
        rm /app/.config/rclone/sa-accounts.zip
fi

# Set bot token & owner ID
if [[ -n $BOT_TOKEN && -n $OWNER_ID ]]; then
	echo "Bot token and owner ID detected"
	cd TelegramShellBot-Rclone
        python3 config.py
fi

echo "SETUP COMPLETED"

# Running Additional Commands
curl -s "https://gist.githubusercontent.com/Frozen12/8190e348792a0bf0c5f4f1a62d1f3a8d/raw/Cloud_Shell_Bot_additonal_command.sh" | bash

python -m http.server 7777 -d /app &
# rclone serve webdav
# rclone serve webdav /root --addr localhost:7777 --user "meshpotato" --pass "strong-fest-rat-Nest6" --log-file=/root/rclone_webdav_log.txt > /dev/null &
echo "rclone serving webdav /root on localhost:7777 --user '"meshpotato"' -pass '"strong-fest-rat-Nest6"'"
# start bot
echo "starting the bot"

npm start
