#!/bin/bash

# Download and install Chrome Remote Desktop
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo apt install ./chrome-remote-desktop_current_amd64.deb

# Download and install Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb

# Install XFCE desktop environment and related packages
sudo apt install --assume-yes xfce4 desktop-base dbus-x11 xscreensaver

# Configure Chrome Remote Desktop session to use XFCE
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'

# Disable lightdm service
sudo systemctl disable lightdm.service

echo "Installation and Configuration completed ..."
