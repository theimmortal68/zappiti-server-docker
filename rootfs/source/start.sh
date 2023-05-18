#!/bin/bash

SERVER_IMAGE_VERSION=425261
SERVER_PATH="/app/bin"
SERVER_VERSION_FILE_PATH="$SERVER_PATH/ServerVersion.txt"

echo "Zappiti Image Starter"
echo "Checking server version..."

if [ -z "$(ls -A /app/bin/)" ]
then
    echo "File not found. Assuming then first install. Copying..."
    find /source/ ! -name start.sh -exec cp -t $SERVER_PATH {} +
else
    if test -f $SERVER_VERSION_FILE_PATH
    then
        echo "File found. Which one is older ?"
        fileVersion=$(cat $SERVER_VERSION_FILE_PATH)
        if [ $fileVersion -lt $SERVER_IMAGE_VERSION ] 
        then
            echo "Server image version is greater than installed version. Upgrading..."
            find /source/ ! -name start.sh -exec cp -t $SERVER_PATH {} +
        else
            echo "Installed version is greater (or equal) than server image version. Nothing to do here."
        fi
    else
        echo "Server file version not found. It means that image was started but not the server. This should not happening."
    fi
fi

echo "Starting server..."
mono /app/bin/Zappiti.Server.NAS.exe