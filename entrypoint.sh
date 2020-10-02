#!/bin/bash

set -euo pipefail

# informative
jq ".pull_request.head.label" < "$GITHUB_EVENT_PATH" \
	| xargs printf "DOING FOR '%s'"


htmlUrl="$(jq ".pull_request.head.repo.html_url" < "$GITHUB_EVENT_PATH")"
git clone htmlUrl \
	--depth 2 "$htmlUrl"
cd "${htmlUrl##*/}"


# see most recent changes
changes="$(git diff-index --color=always -M -C -p HEAD~1 \
	| grep $'^\033\[3[12]m' \
	| sed -r 's/\x1b\[[0-9;]*m?//g' >recent-changes)"

# basic test
case "$changes" in
	*awesome*)
		echo "UH OH"
		return 1
		;;
	*)
		return 0
		;;
esac

perl --verison
node --version
python --version
go version
