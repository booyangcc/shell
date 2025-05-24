#!/bin/bash

dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

for rc_file in "$dir"/easyuse/*profile; do
    if [[ -f "$rc_file" ]]; then
        source "$rc_file"
    fi
done
