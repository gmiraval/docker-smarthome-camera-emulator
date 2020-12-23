#!/bin/bash

echo "running main  --- Video Clip ---"

IP="200.32.54.152"
PORT="50040"

cd main
./main -i$IP -p$PORT

exec "$@"