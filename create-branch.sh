#!/bin/sh -eu

# test18 is the name of the branch to be created. you'll want GitHub's `gh` to be installed
# we make some assumptions about the branch name (ex. test17) and the number of the pull request (https://github.com/owner/repo/pull/17). in nearly all cases they won't be in sync and this script will not work

git checkout -b "$1"
echo "awesome thing" > test.txt
git commit --no-edit -m "" --allow-empty --allow-empty-message
gh pr create --title "$1" --body ""
git switch main
gh pr close ${1##test} # --delete-branch
gh pr view ${1##test} --web
