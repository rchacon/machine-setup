# machine-setup

My machine setup automated with Ansible.

## Installation

Download repo:
```bash
curl -L https://api.github.com/repos/rchacon/machine-setup/tarball | tar xz
```

## Setup Macbook

Install additional depedencies:
```bash
./provsion.sh
```

Run playbook:
```bash
cd deployment
ansible-playbook -i local macbook.yml -K -e "github_email=<GITHUB_EMAIL>"
```

Note: The sublime : Install Package Control task (`deployment/roles/common/tasks/sublime.yml`) will fail the first time because the
`~/Library/Application\ Support/Sublime\ Text\ 3/` directory isn't created until the first time you open Sublime Text.

So for now, open Sublime and re-run the playbook.

Apps that need to be installed manually:

- mupen64plus-bundle-osx64-2.5
- Driver for xbox 360 controllers
- Hotspot Shield
- Fluenz
- HP Printer/Scanner software

## Setup Ubuntu/Mint

Install additional dependencies:
```bash
sudo apt-get install python-pip
sudo apt-get install python-setuptools
pip install --user ansible
```

Run playbook:
```bash
cd deployment
ansible-playbook -i local ubuntu.yml -K -e "github_email=<GITHUB_EMAIL>"
```

Manual Steps:

- Create ssh keys for github accounts
- Install the Sublime license
