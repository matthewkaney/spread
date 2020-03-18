#!/bin/bash

# Pull latest version of spread
cd /usr/local/spread
sudo git pull --quiet
cd - > /dev/null

if [ -z "$1" ]
    echo "Test"
elif
    echo "Test... $1"
fi