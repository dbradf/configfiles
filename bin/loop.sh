#!/usr/bin/env bash

main() {
    local count="$1"
    shift
    local cmd="$*"

    local i=0

    while [ $i -lt $count ]; do
        echo "Starting iteration: $i"
        $cmd
        if [ $? -ne 0 ]; then
            echo "Failure on iteration $i" >&2
            exit 1
        fi
        ((i = i + 1))
    done
}

main $*
