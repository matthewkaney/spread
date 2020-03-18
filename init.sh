#!/usr/bin/env bash
{
    # Delete old version of spread if installed
    sudo rm -rf /usr/local/spread

    # Install new version
    sudo git clone https://github.com/mindofmatthew/spread.git /usr/local/spread

    # Set up symlink to spread script
    sudo ln -sf /usr/local/spread/util/spread.sh /usr/local/bin/spread
}