#!/bin/bash

if [ -n "$SSH_CLIENT" ]; then
    TEXT="IP \`$(echo $SSH_CLIENT | awk '{print $1}')\` logged into \`${USER}@$(hostnamectl --static)\`
SSH Connection running on PID \`$(pgrep '^ssh$' -u ${USER})\`"
fi

# send_text takes two parameter telegram bot id and telegram chat id  
function send_text(){
    curl -X POST \
    -H "Content-Type: application/json" \
    -d "{\"chat_id\": "$2", \"text\": \"$TEXT\", \"disable_notification\": true, \"parse_mode\": \"MarkdownV2\"}" \
    https://api.telegram.org/bot$1/sendMessage > /dev/null 2>&1
}