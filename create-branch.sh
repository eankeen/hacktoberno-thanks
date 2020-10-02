#!/bin/sh -eu

# test18 is the name of the branch to be created. you'll want GitHub's `gh` to be installed
# we make some assumptions about the branch name (ex. test17) and the number of the pull request (https://github.com/owner/repo/pull/17). in nearly all cases they won't be in sync and this script will not work

text="Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."

git checkout -b "$1"
echo "${text}\nawesome thing\nupdate README.md" > test.txt
git commit --no-edit -m "" --allow-empty --allow-empty-message
gh pr create --title "$1" --body ""
git switch main
gh pr close ${1##test} # --delete-branch
gh pr view ${1##test} --web
