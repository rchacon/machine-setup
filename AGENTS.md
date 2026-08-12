# AGENTS.md

This file provides guidance to AI coding agents (Claude Code, etc.) when working with code in this repository.

## Architecture

This is a personal machine-setup repo (dotfiles/provisioning) automated with
Ansible, not an application. There's no build/test suite -- "correctness" is
judged by reading the playbooks/tasks, not by running anything, since the
plays are only safe to actually execute against a real machine being
provisioned.

Two target platforms, one shared role:

- `deployment/ubuntu.yml` runs the `ubuntu` role then the `common` role.
- `deployment/macbook.yml` runs the analogous `osx` role then `common`
  (README flags macOS support as "likely outdated").
- `deployment/roles/common/` holds cross-platform tasks (git config via
  `templates/gitconfig.j2`, dotfiles, terminal, Sublime Package Control --
  the latter tagged `[never, post-install]` so it only runs when explicitly
  requested with `--tags post-install`, since Package Control itself has to
  be installed manually first).
- `deployment/roles/ubuntu/tasks/apt.yml` is the flat list of `apt`
  packages plus one block per package needing a third-party repo/key (Docker,
  yarn, Sublime, VS Code, 1Password) -- add new simple packages to the
  `with_items` list near the top rather than a new task.
- `deployment/local` is the Ansible inventory file for `ansible-playbook -i
  local ...` (always targets `localhost` — see README's Usage section).

## Commands

There's no test/build/lint step. To validate a change, run the playbook
against a real machine per the README:

```bash
cd deployment
ansible-playbook -i local ubuntu.yml -K -e "github_name='<NAME>'" -e "github_email=<EMAIL>"
```

## Git conventions

PRs are merged with a merge commit (`gh pr merge --merge`), not squash or
rebase — preserves the individual commit history from the PR branch.
After merging, delete the branch both locally and remotely
(`gh pr merge --merge --delete-branch` does both in one step).

When addressing review comments on an open PR, break the fixes up into
separate commits along logical lines (one commit per distinct issue/fix,
not one commit for everything) rather than a single catch-all commit, and
reply to each review comment on GitHub referencing the specific commit
hash that addressed it, formatted as a hyperlink to the commit rather than
just backticked text (e.g. "Fixed in
[abc1234](https://github.com/<owner>/<repo>/commit/abc1234).") -- keeps
the review thread traceable to the exact change that resolved it, one
click away, rather than a generic "addressed" reply pointing at the whole
PR.

When *submitting* a code review on a PR, post each finding as its own
separate inline review comment (anchored to the specific file/line via
`gh api repos/{owner}/{repo}/pulls/{number}/comments`, not a single bundled
`gh pr comment`) -- a combined comment listing every finding only supports
one flat reply thread, making it impossible to reply to (or resolve)
individual findings separately later.
