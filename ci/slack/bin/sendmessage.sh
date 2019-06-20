#!/usr/bin/env bash

set -e pipefail

bin_dir="$( cd "$( dirname "$0" )" && pwd )"
slack_dir="$( dirname "$bin_dir" )"

message_template_file="${slack_dir}/${SLACK_MSG_TYPE}-message.gtmpl.json"
mkdir $HOME/tmp
rendered_message_file="$HOME/tmp/message.json"

gomplate -f "${message_template_file}" > "${rendered_message_file}"
http POST https://avalara.slack.com/api/chat.postMessage Content-Type:application/json Authorization:"Bearer $SLACK_BOT_TOKEN" < "${rendered_message_file}"
