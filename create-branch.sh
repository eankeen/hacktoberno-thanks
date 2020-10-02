#!/bin/sh -eu

git checkout -b "$1"
echo "awesome thing" > test.txt
git commit --no-edit -m "" --allow-empty --allow-empty-message
gh pr create --title "$1" --body ""
git switch main
gh pr close ${1##test} # --delete-branch
gh pr view ${1##test} --web
