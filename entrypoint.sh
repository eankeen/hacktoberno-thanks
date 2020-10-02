#!/bin/sh -l

echo "Hello $1"

changes="$(git diff-index --color=always -M -C -p HEAD~1 \
	| grep "$(printf '^\033\[3[12]m')" \
	| sed -r 's/\x1b\[[0-9;]*m?//g' >recent-changes)"

perl --version

ls /usr/bin
