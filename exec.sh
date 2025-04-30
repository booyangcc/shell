#!/bin/bash
dir="$(cd "$(dirname "$0")" && pwd)"

find "$dir" -name "*profile" | while IFS= read -r rc_file; do
    . "$rc_file"
done
