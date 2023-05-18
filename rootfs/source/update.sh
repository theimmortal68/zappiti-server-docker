#!/bin/bash

SERVER_PATH="/app/bin"
PROCESS="$SERVER_PATH/process.txt"
UPDATE_FILE_PATH="$SERVER_PATH/update.tar.gz"

if test -f $UPDATE_FILE_PATH
then
    echo "Extracting..."
    tar -zvxf $UPDATE_FILE_PATH -C $SERVER_PATH
    echo "Done !"
else
    echo "Update file not found."
fi

echo "Update installed. Killing now container. It should reboot if configured properly."

processId=$(cat $PROCESS)
kill 5 $processId