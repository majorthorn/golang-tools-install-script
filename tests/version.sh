#!/bin/bash
set -e

unset GOROOT
unset GOPATH
"../goinstall.sh --version 1.12"
