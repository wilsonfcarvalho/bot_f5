#!/bin/bash
# f5-slack-bot - install.sh
# https://github.com/ArtiomL/f5-slack-bot
# Artiom Lichtenstein
# v1.0.1, 24/11/2017

tmsh create ilx workspace SLACK_BOT from-uri https://raw.githubusercontent.com/wilsonfcarvalho/bot_f5/master/bin/bot_f5.tgz > /dev/null 2>&1
read -s -p "Enter Slack API Token: " str_AToken
echo
sed -i "s/|| ''/|| '$str_AToken'/" /var/ilx/workspaces/Common/SLACK_BOT/extensions/SLACK_BOT/index.js
nohup /usr/bin/nodejs /var/ilx/workspaces/Common/SLACK_BOT/extensions/SLACK_BOT/index.js > /var/log/bot_f5 &
