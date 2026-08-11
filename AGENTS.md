# AGENTS.md

This file provides guidance to AI coding agents (Claude Code, etc.) when working with code in this repository.

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
