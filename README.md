# machine-setup

My machine setup automated with Ansible.

## Installation

Download repo:
```bash
curl -L https://api.github.com/repos/rchacon/machine-setup/tarball | tar xz
```

## Setup Macbook

Install ansible via homebrew:
```bash
/usr/bin/env ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install ansible
```

Run playbook:
```bash
cd deployment
ansible-playbook -i local macbook.yml -K -e "github_email=<GITHUB_EMAIL>"
```

## Setup Ubuntu 18.04

Install ansible via pip:
```bash
sudo apt-get install python-pip python-setuptools
pip install --user wheel ansible
```

Run playbook:
```bash
cd deployment
ansible-playbook -i local ubuntu.yml -K -e "github_email=<GITHUB_EMAIL>"
```

## Manual Steps

- Enable infinite scroll in terminator
- Create ssh keys for github accounts
- Install the Sublime license

## Caveats

The Sublime Install Package Control task (`deployment/roles/common/tasks/sublime.yml`) will fail the first time because the `~/Library/Application\ Support/Sublime\ Text\ 3/` directory on macOS and `~/.config/sublime-text-3/` on Ubuntu aren't created until the first time you open Sublime Text. So for now, open Sublime and re-run the playbook.

For Ubuntu, your user is added to the `docker` group but in order for it to take affect you have to logout and log back in.

## TODO

- Install Chrome and Slack
