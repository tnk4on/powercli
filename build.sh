#!/bin/bash

podman login docker.io
CURDIR=$PWD
cd Containerfile.d

# Building Image
for f in Containerfile*
do
    echo -e "\n### Build ${f/Containerfile./} ###"
    buildah bud -t powercli:${f/Containerfile./} -f $f
done

# Test
for f in Containerfile*
do
    echo -e "\n### Run ${f/Containerfile./} ###"
    podman run --rm powercli:${f/Containerfile./} pwsh -v
done

# Push to Docker.io
for f in Containerfile*
do
    echo -e "\n### Push powercli:${f/Containerfile./} ###"
    podman push powercli:${f/Containerfile./} docker.io/tnk4on/powercli:${f/Containerfile./} --format v2s2
    if [ "${f/Containerfile./}" = "mcr-alpine-3.12" ]; then
        echo -e "\n### Push powercli:latest"
        podman push powercli:${f/Containerfile./} docker.io/tnk4on/powercli --format v2s2
    fi
done

cd $CURDIR