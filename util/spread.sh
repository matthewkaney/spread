#!/bin/bash

# Pull latest version of spread
cd /usr/local/spread
sudo git pull --quiet
cd - > /dev/null

if [ -z "$1" ]
then
    # Script name is not provided
    echo -e "Please specify the script you'd like to run:\n"
    for f in /usr/local/spread/scripts/*
    do
        fn=$(basename $f)
        fdesc=$(head -n1 $f)
        echo -e "\e[1m${fn::-3}\e[0m"
        echo -e " - ${fdesc:1}\n"
    done
else
    # Script name is provided
    echo "Running $1"
    source /usr/local/spread/scripts/$1.sh
fi