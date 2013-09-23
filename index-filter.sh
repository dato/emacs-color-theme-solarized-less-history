#!/bin/bash

set -e

# Delete all non-Emacs stuff until it's deleted in Greg's repo; also
# necessary in Bill Stillwell's merge (b42c5a0).
if (git rev-list d254a5b^..44f8e9e^;
    echo b32576a2f19c24d1c45e2bae46e84f81c21ebd3a;
    echo 9cfc98a1edca42c7f6e2fd2d57905a604b983eda;
    echo b42c5a0bdb8b9dbf9a845834723e5b4269d29067) | grep -q "$GIT_COMMIT"
then
    git ls-tree -rz --name-only d254a5b^ |
        xargs -0 git rm --quiet --cached
fi

# Ignore that emacs-color-theme-solarized subdirectory ever existed,
# directly creating color-theme-solarized.el in the top-level directory.
FILE="emacs-color-theme-solarized/color-theme-solarized.el"
OUTPUT=$(git ls-tree "$GIT_COMMIT" "$FILE")
read -a FILE_INFO <<< "$OUTPUT"

if [[ ${FILE_INFO[3]} = $FILE ]]; then
    git update-index --add --cacheinfo 100644 "${FILE_INFO[2]}" "${FILE##*/}"
    git update-index --force-remove "$FILE"
fi
