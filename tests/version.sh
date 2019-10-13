#!/bin/bash
set -e

unset GOROOT
unset GOPATH
"$(dirname "$0")/goinstall.sh --version 1.12"
