# machine-setup

My machine setup automated with Ansible.

## Installation

Download repo:
```bash
curl -L https://api.github.com/repos/rchacon/machine-setup/tarball | tar xz
```

## Setup Ubuntu

Install ansible via pip:
```bash
sudo apt-get install python3-pip python3-setuptools
pip install --user wheel ansible
```

## Setup Macbook

**Warning: This is likely outdated and may not work**

Install ansible via homebrew:
```bash
/usr/bin/env ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install ansible
```

## Usage

Run playbook:
```bash
cd deployment
ansible-playbook -i local <ubuntu.yml|macbook.yml> -K -e "github_name='<FIRST_NAME> <LAST_NAME>'" -e "github_email=<GITHUB_EMAIL>"
```

It's possible that `ansible-playbook` was installed somewhere that isn't in your path. The output from pip installing `ansible-playbook` should say where it was installed.

After `Package Control` for sublime has been manually installed run `post-install` tasks:

```bash
ansible-playbook -i local <ubuntu.yml|macbook.yml> -K --tags "never,post-install"
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
