#!/bin/bash

PROTO_VERSION=3.5.1

wget https://github.com/google/protobuf/releases/download/v$PROTO_VERSION/protobuf-python-$PROTO_VERSION.tar.gz -O protobuf.tar.gz
tar -xf protobuf.tar.gz

rm -rf google
CURDIR=$(dirname `pwd`)
export PROTOC=$CURDIR/hh-protoc3/protoc3

pushd protobuf-$PROTO_VERSION/python
python setup.py build
mv build/lib/google $CURDIR/python-protobuf
popd

rm protobuf.tar.gz
rm -rf protobuf-$PROTO_VERSION
