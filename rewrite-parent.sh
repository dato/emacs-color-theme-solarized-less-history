#!/bin/bash

set -e

read parent

if [[ $parent = "-p 9f1ba40686ccbf54f10851d4f1a14830fa543ae9" ]]; then
    echo ""  # Make Greg's first commit the new root.
else
    echo "$parent"
fi
