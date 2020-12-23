#!/bin/bash
cd RTSPServer

SERVICE="live555MediaSer"

PID=$(pgrep -x "$SERVICE")

if [ $PID > 0 ]
then
    kill -9 $PID
    echo "Service killed"
fi
