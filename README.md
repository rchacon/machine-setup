# machine-setup

My machine setup automated with Ansible.

## Installation

- Download repo
- Install ansible: `sudo pip install ansible`

## Setup Macbook

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

