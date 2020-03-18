#!/bin/bash

# Pull latest version of spread
cd /usr/local/spread
sudo git pull --quiet
cd - > /dev/null

if [ -z "$1" ]
then
    # Script name is not provided
    echo "Test"
else
    # Script name is provided
    echo "Test... $1"
fi