#!/bin/bash
cd RTSPServer
SERVICE="live555MediaSer"
SERVICE_NAME="live555RTSPServer"
if pgrep -x "$SERVICE" > pid
then
    echo "RunServer.sh            $SERVICE_NAME is running"
else
    echo "RunServer.sh            $SERVICE_NAME starting"
    ./live555MediaServer 1> server_stdout 2> server_stderr &
    pid=$!
    echo $pid > pid
fi

pgrep -x "$SERVICE" > pid