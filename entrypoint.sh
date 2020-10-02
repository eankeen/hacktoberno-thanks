#!/bin/sh

doCheck() {
	ls .git
	git log
	# see most recent changes
	# changes="$(git diff-index --color=always -M -C -p HEAD~1 \
		# | grep $'^\033\[3[12]m' \
		# | sed -r 's/\x1b\[[0-9;]*m?//g')"

	# diff-index doesn't work exactly with dot notation?
	git diff --color=always -M -C -p HEAD~1..HEAD~2

	# remember we do `HEAD~1..HEAD~2` because GitHub makes its own merge commit
	changes="$(git diff --color=always -M -C -p HEAD~1..HEAD~2 | grep "$(printf '^\033\[3[12]m')" | sed -r 's/\x1b\[[0-9;]*m?//g')"

	echo "CHANGES: $changes"

	# basic test
	changes="$(echo "$changes" | tr '[:upper:]' '[:lower:]')"
	case "$changes" in
		*awesome*)
			echo "UH OH"
			exit 1
			;;
		*)
			echo "good commit"
			return 0
			;;
	esac

}

echo "$1"

printf "merging head repo '%s' into base '%s'\n" "$GITHUB_HEAD_REF" "$GITHUB_BASE_REF"

printf "AA%s\nBB%s\nCC%s\n" "$GITHUB_SERVER_URL" "$GITHUB_REPOSITORY" "$GITHUB_HEAD_REF"

htmlUrl2="${GITHUB_SERVER_URL}/${GITHUB_REPOSITORY}/tree/${GITHUB_HEAD_REF}"

printf "HTMLURL: %s\n" "$htmlUrl2"

git clone "$htmlUrl2" \
	--depth 2
cd "$(echo $htmlUrl2 | sed 's|.*/||')" \
	&& ls -alF

cd "$GITHUB_WORKSPACE"
doCheck
