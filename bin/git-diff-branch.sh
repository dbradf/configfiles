#!/usr/bin/env bash

main() {
    local branch=$1

    git diff $(git merge-base --fork-point $branch)
}

main $*

