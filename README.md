# machine-setup

My machine setup automated with Ansible.

## Installation

Download repo:
```bash
$ curl -L https://api.github.com/repos/rchacon/machine-setup/tarball | tar xz
```

Install dependencies:
```bash
$ ./provision.sh
```

## Usage

Note: The sublime : Install Package Control task (`deployment/roles/common/tasks/sublime.yml`) will fail the first time because the
`~/Library/Application\ Support/Sublime\ Text\ 3/` directory isn't created until the first time you open Sublime Text.

So for now, open Sublime and re-run the playbook.

### Setup Macbook

```bash
$ cd deployment
$ ansible-playbook -i local macbook.yml -K -e "github_email=<GITHUB_EMAIL>"
```

Apps that need to be installed manually:

- mupen64plus-bundle-osx64-2.5
- Driver for xbox 360 controllers
- Hotspot Shield
- Fluenz
- HP Printer/Scanner software

## Setup Ubuntu/Mint

```bash
$ cd deployment
$ ansible-playbook -i local ubuntu.yml -K -e "github_email=<GITHUB_EMAIL>"
```

Manual Steps:

- Create ssh keys for github accounts
- Add Windows VM
- Copy ~/Documents
- Install the Sublime license
