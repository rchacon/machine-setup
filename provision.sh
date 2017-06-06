#!/usr/bin/env bash

if [[ $(uname) == 'Darwin' ]]; then
    if [ ! -x /usr/local/bin/brew ]; then
        echo "installing homebrew"
        /usr/bin/env ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
        echo "homebrew is installed"
    fi
fi


if [ ! -x /usr/local/bin/ansible ]; then
    echo "installing ansible via pip"
    sudo pip install ansible
else
    echo "ansible is installed"
fi

echo "Ready to go!"
