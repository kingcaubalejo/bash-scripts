#!/bin/bash

#Usecase: When you're running out of ram
# This will create the swap file
sudo dd if=/dev/zero of=/swapfile bs=1G count=2

# Adding permissions to the swap file created
sudo chown root:root /swapfile
sudo chmod 0600 /swapfile

#Turn on the swap file
sudo mkswap /swapfile

#Activate the swap file
sudo swapon /swapfile

#View swapfile
sudo swapon -s