#!/bin/sh -eu

git checkout -b "$1"
echo "awesome thing" > test.txt
git commit --no-edit -m "" --allow-empty --allow-empty-message
gh pr create -H --title "" --body ""