#!/bin/bash

set -e

if ! which go; then
  echo "No go command available"
  exit 1
fi

GOPATH="${GOPATH:-~/go}"
export PATH=$PATH:$GOPATH/bin

if ! which gingko; then
	echo "Downloading ginkgo tool"
	go install github.com/onsi/ginkgo/v2/ginkgo@v2.6.1
fi

ginkgo build ./functests/*
