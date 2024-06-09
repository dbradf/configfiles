#!/usr/bin/env bash

git status | grep "modified:" | awk '{print $2}' | xargs yarn prettier -c
