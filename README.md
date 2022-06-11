# Cloud Shell Bot
- A Telegram Bot that can run shell command
- This Telegram bot uses [botgam](https://botgram.js.org) to communicate with Telegram
- Source code repo : [TelegramShellBot-Rclone](https://github.com/Frozen12/TelegramShellBot-Rclone)
- Core repo : [shell-bot](1https://github.com/botgram/shell-bot)

## Environment variable
- Set A
 - `BOT_TOKEN`
 - `OWNER_ID`
 - `RCLONE_CONFIG_BASE64`
- Set B 
 - `BOT_TOKEN`
 - `OWNER_ID`
 - `RCLONE_CONFIG_URL`

## Environment variable value sample
- Set A
 - `BOT_TOKEN` : `5562055520:AAHtgue4GLR_02-BlM1bD7rodSsFGaWG5eY`
 - `OWNER_ID` : 1234567890
 - `RCLONE_CONFIG_BASE64` : `I0RyaXZlIHJvb3QKW21kcml2ZV0KdHlwZSA9IGRyaXZlCmNsaWVudF9pZCA9IDY3NTE0MTI3MDU0ODItdTBwbGZpZnU1ZGZnY2poZDdsZDRrbXJ0Z2Z1ZjMxN2ZmaWEuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20KY2xpZW50X3NlY3JldCA9IGhaZHFDazBnX2FnNk83dXhaR0xmUDlvOApzY29wZSA9IGRyaXZlCnRva2VuID0geyJhY2Nlc3NfdG9rZW4iOiJ5YTI5LmJhMEFaN00tN1VKcWNraWRKMy13`
- Set B 
 - `BOT_TOKEN` : `5562055520:AAHtgue4GLR_02-BlM1bD7rodSsFGaWG5eY`
 - `OWNER_ID` : 1234567890
 - `RCLONE_CONFIG_URL` : https://example.com/directory/rclone.conf


## Installation
- First collect the values for Set A or Set B Environment
  -  `BOT_TOKEN` : A @BotFather bot token. [Tutorial](https://www.siteguarding.com/en/how-to-get-telegram-bot-api-token)
  - `OWNER_ID` : Your Telegram user ID. Talk with [this](https://t.me/userinfobot) bot
  - `RCLONE_CONFIG_BASE64`: Your Rclone config, you need to encode it to [Base64](https://www.base64encode.org) [OPTIONAL]
  - `RCLONE_CONFIG_URL` : Your Rclone config file (rclone.conf) direct url
- Deploy the Docker Container
- Fill up Set A or Set B Environment vallues
- Start the container
- Now open Telegram bot chat thread and use the commands below to interact with your bot

## Commands
- To use rclone commands do `/run rclone [param]...`
```
run - Execute command
enter - Send input lines to command
r - Alias for /run or /enter
type - Type keys into command
control - Type Control+Letter
meta - Send the next typed key with Alt
keypad - Toggle keypad for special keys
redraw - Force the command to repaint
end - Send EOF to command
cancel - Interrupt command
kill - Send signal to process
status - View status and current settings
cd - Change directory
env - Manipulate the environment
shell - Change shell used to run commands
resize - Change the terminal size
setsilent - Enable / disable silent output
setlinkpreviews - Enable / disable link expansion
setinteractive - Enable / disable shell interactive flag
help - Get help
file - View and edit small text files
upload - Upload and overwrite raw files
r - Alias for /run or /enter
```

## Special Thanks 
- [Alba Mendez ](https://github.com/mildsunrise)
- [menubboi](https://github.com/menubboi)

`Note : Deploying The container in heroku might get your account suspended`

