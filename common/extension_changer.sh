#!bin/bash

#
# Copyright (C) 2021 Simone 'DarkJoker360' Esposito
# SPDX-License-Identifier: GPL-3.0-only
#

#
# Simple script for changing extension to one or more files
#

if [ "$1" == "" ]; then
    echo "No extension to be changed specified, aborting."
    exit 0;
fi

[ "$2" == "" ] && echo "No new extension specified, removing extensions..."

find . -type f -name "*$1" -exec rename 's/\'$1'$/'$2'/' '{}' \;
echo "Done."
