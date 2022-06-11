#!/bin/bash

# Install rclone static binary
wget -q https://downloads.rclone.org/v1.58.1/rclone-v1.58.1-linux-amd64.zip
unzip -q rclone-v1.58.1-linux-amd64.zip
export PATH=$PWD/rclone-v1.58.1-linux-amd64:$PATH
echo "Rclone installed successfully"

# setup rclone.conf file
if [[ -n $RCLONE_CONFIG_BASE64 ]]; then
	echo "Rclone config detected"
	echo "[DRIVE]" > rclone.conf
    mkdir -p $HOME/.config/rclone/
	echo "$(echo $RCLONE_CONFIG_BASE64|base64 -d)" >> $HOME/.config/rclone/rclone.conf
        echo "Rclone config placed in position"
fi

# Set bot token g owner ID

if [[ -n $BOT_TOKEN && -n $OWNER_ID ]]; then
	echo "Bot token and owner ID detected"
	cd TelegramShellBot-Rclone
        python3 config.py
fi

# Run additional Command

if [[ -n $ADDITIONAL_COMMAND ]]; then
	echo "RUNNING additional Command"
	$ADDITIONAL_COMMAND



fi


echo "SETUP COMPLETED"

# start boy
npm start
