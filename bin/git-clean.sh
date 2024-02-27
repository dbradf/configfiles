#!/usr/bin/env bash

main() {
    git reset --hard HEAD
    git clean -fd
}

main $*
