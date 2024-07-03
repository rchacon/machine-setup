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

## Setup Ubuntu/Linux Mint

Install dependencies:
```bash
sudo apt-get install python3-pip
python3 -m pip install --user ansible
```

Run playbook:
```bash
cd deployment
ansible-playbook -i local ubuntu.yml -K -e "github_email=<GITHUB_EMAIL>"
```

## Manual Steps

- Enable infinite scroll in terminator (ubuntu)
- Install Chrome and Slack (ubuntu)
- Make bash default shell with `chsh -s /bin/bash` (macOS)
- Create ssh keys for github accounts (both)
- Install the Sublime license (both)
