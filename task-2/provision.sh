#!/bin/bash
set -e
 sudo apt-get update && apt-get install -y python-dev python-pip
 sudo pip install --upgrade pip
 sudo pip install ansible
 echo "===== finished provision.sh ======="
