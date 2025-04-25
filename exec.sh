#!/bin/bash
for rc_file in $(find $(pwd) -name "*rc"); do
    echo "source $rc_file"
    source "$rc_file"
done

