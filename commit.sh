#!/bin/bash

CURDIR=$PWD
cd Containerfile.d

# Git add & commit
for f in Containerfile*;do
    git add $f;
    git commit -m "${f/Containerfile./}";
done

cd $CURDIR