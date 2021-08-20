#!/bin/bash

##
# Usage: `. docker-aliases.sh`.
# To show help type `dc` in console.
#
GITHUB_URL="https://raw.githubusercontent.com"
wget $GITHUB_URL/knoxknox/dotfiles/master/home/.docker_aliases

cat ~/.docker_aliases >> ~/.profile && source ~/.profile && rm ~/.docker_aliases
