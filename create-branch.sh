#!/bin/sh -eu

git checkout "$1"
echo "awesome thing" > test.txt
git commit --no-edit -m "" --allow-empty --allow-empty-message
