#!/bin/bash
# f5-slack-bot - install.sh
# https://github.com/ArtiomL/f5-slack-bot
# Artiom Lichtenstein
# v1.0.1, 24/11/2017

tmsh create ilx workspace SLACK_BOT2 from-uri https://raw.githubusercontent.com/wilsonfcarvalho/bot_f5/master/bin/bot_f5.tgz > /dev/null 2>&1
read -s -p "Enter Slack API Token: " str_AToken
echo
sed -i "s/|| ''/|| '$str_AToken'/" /var/ilx/workspaces/Common/SLACK_BOT2/extensions/SLACK_BOT2/index.js
nohup /usr/bin/nodejs /var/ilx/workspaces/Common/SLACK_BOT2/extensions/SLACK_BOT2/index.js > /var/log/f5-slack-bot &

