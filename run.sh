#!/bin/sh
echo 'Running...'

claris=$(cd "$(dirname "$0")"; pwd)
PYTHONPATH="${PYTHONPATH}:${claris}"
export PYTHONPATH

chmod +x "$claris"/bin/hubot

while true
	do
	"$claris"/bin/hubot --name Claris -a skype
done

