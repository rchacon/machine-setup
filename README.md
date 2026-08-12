# machine-setup

My machine setup automated with Ansible.

## Installation

Download repo:
```bash
curl -L https://api.github.com/repos/rchacon/machine-setup/tarball | tar xz
```

## Setup Ubuntu

Install required apt packages:
```bash
sudo apt-get install python3-pip python3-setuptools
```

Linux Mint 22.3 includes `python3.12` which is marked as protected and wouldn't let me install pip packages using `--user`. The error message required me to use a virtual environment.
```bash
sudo apt install python3.12-venv
```

Create the virtual env and install ansible into it:
```bash
make install
```

## Setup Macbook

**Warning: This is likely outdated and may not work**

Install ansible via homebrew:
```bash
/usr/bin/env ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install ansible
```

## Usage

Copy `.env.sample` to `.env`, fill in your name and email, and set `TARGET` to `ubuntu` or `macbook`, then run the playbook via the Makefile:
```bash
make run
```

After `Package Control` for sublime has been manually installed run `post-install` tasks:

```bash
make post-run
```

## Manual Steps

- Enable infinite scroll in terminator (ubuntu)
- Install Chrome and Slack (ubuntu)
- Make bash default shell with `chsh -s /bin/bash` (macOS)
- Create ssh keys for github accounts (both)
- Install `Package Control` package and license for Sublime (both)

## Caveats

For Ubuntu, your user is added to the `docker` group but in order for it to take affect you have to logout and log back in.

For macOS, installing virtualbox will fail the first time because of macOS's security settings. After this step fails go into Security settings and enable Oracle then re-run the playbook.
