#!/usr/bin/env bash
{
    # Delete old version of spread if installed
    sudo rm -rf /usr/local/codeserver

    # Install new version
    sudo git clone https://github.com/mindofmatthew/spread.git /usr/local/spread

    # Set up symlink to spread script
    sudo ln -s /usr/local/spread/util/spread.sh /usr/local/bin/spread
}