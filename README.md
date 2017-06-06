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

