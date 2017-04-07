#!/bin/bash

set -exu

cwd="$(pwd)"

pushd /usr/share/mc/syntax/

if ! grep -q 'rust[.]syntax' Syntax
then
    sudo patch -p1 < $cwd/Syntax.patch
fi

sudo cp -v $cwd/{rust,ml,python}.syntax .
popd
