#!/bin/bash

# Create rclone.conf file from base64
if [[ -n $RCLONE_CONFIG_BASE64 ]]; then
	echo "Rclone config detected"
	echo "[DRIVE]" > rclone.conf
    mkdir -p /.config/rclone
	echo "$(echo $RCLONE_CONFIG_BASE64|base64 -d)" >> /.config/rclone/rclone.conf
fi

# fetch rclone.conf from url

if [[ -n $RCLONE_CONFIG_URL ]]; then
	echo "Fetching rclone.conf from url"
	mkdir -p /.config/rclone
    curl -o/.config/rclone/rclone.conf "$RCLONE_CONFIG_URL"

fi

# Set /.config/rclone/rclone.conf as rclone config paths
rclone config --config="/.config/rclone/rclone.conf" 
echo " Rclone Config Files is located at /.config/rclone/rclone.conf "

# Set bot token & owner ID

if [[ -n $BOT_TOKEN && -n $OWNER_ID ]]; then
	echo "Bot token and owner ID detected"
	cd TelegramShellBot-Rclone
        python3 config.py
fi

echo "SETUP COMPLETED"

# start bot
echo "starting the bot"
npm start
