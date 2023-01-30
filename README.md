# SSH Monitor
Monitor SSH Connection automatically through telegram

## Features
- Log username from connected user
- Log connected IP
- Log connected user's SSH process ID 
- Send log information directly through telegram

## Usage
A script to help with configuring ssh monitor on your device.

Must be run as root.

To use, supply telegram bot id as first argument and telegram chat id as second argument.

Example:
```
./setup.sh 123456789:abcdefghijklmnoprstuvwxyz 987654321
```
This information can be accessed through `setup.sh -h`.
```
./setup.sh -h
```
---

### Getting Telegram Bot ID
1. Search for `@BotFather` in telegram.
2. Type `/newbot` to create a new bot.
3. Choose a name for the bot.
4. Find the token for HTTP API
5. Safely store the HTTP API token

### Getting Telegram Chat ID
1. Search for `@RawDataBot` in telegram.
2. Type `/start` to get telegram data.
3. Find the key of `chat` and access the `id` value from it. 
```json
"message": {
    "chat": {
        "id": 12345678
    }
}
```
4. Safely store the Chat ID
