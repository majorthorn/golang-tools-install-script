#!/bin/bash
set -e
echo "Go environment after setup:"
env | grep "^GO"

mkdir -p "$GOPATH/src/hello"
pushd "$GOPATH/src/hello"
echo "Writing hello.go"
cat >hello.go <<EOF
package main

import (
    "fmt"
    "runtime"
)

func main() {
    fmt.Printf("go version %s %s/%s\n", runtime.Version(), runtime.GOOS, runtime.GOARCH)
}
EOF
echo "Building hello test project"
go build
echo "Install hello test project"
go install
echo "Run hello test project"
hello
popd

GOVER=`go version`

echo "$GOVER"
if grep -q "1.12" <<< "$GOVER"; then
	echo "Version contains 1.12"
	exit 0
else
	echo "Does not contain 1.12"
	exit 1
fi