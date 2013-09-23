#!/bin/bash

set -e

DIR=$(cd "$(dirname "$BASH_SOURCE")" && pwd)

do_filter_branch() {
    git filter-branch -f \
        --index-filter "$DIR/index-filter.sh" \
        --parent-filter "$DIR/rewrite-parent.sh"
}

git for-each-ref refs/heads | while read commit type branch; do
    git checkout -b "${branch##*/}-new" "$commit"
    do_filter_branch
done
