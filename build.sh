#!/bin/bash

podman login docker.io
CURDIR=$PWD
cd Containerfile.d

# Building Image
buildah bud -t powercli:alpine-scratch -f Containerfile.alpine-scratch
buildah bud -t powercli:mcr-alpine-3.12 -f Containerfile.mcr-alpine-3.12
buildah bud -t powercli:photon -f Containerfile.photon
buildah bud -t powercli:ubi8-minimal -f Containerfile.ubi8-minimal

# Test
podman run --rm powercli:alpine-scratch pwsh -v
podman run --rm powercli:mcr-alpine-3.12 pwsh -v
podman run --rm powercli:photon pwsh -v
podman run --rm powercli:ubi8-minimal pwsh -v

# Push
podman push powercli:alpine-scratch docker.io/tnk4on/powercli:alpine-scratch --format v2s2
podman push powercli:mcr-alpine-3.12 docker.io/tnk4on/powercli --format v2s2
podman push powercli:mcr-alpine-3.12 docker.io/tnk4on/powercli:mcr-alpine-3.12 --format v2s2
podman push powercli:photon docker.io/tnk4on/powercli:photon --format v2s2
podman push powercli:ubi8-minimal docker.io/tnk4on/powercli:ubi8-minimal --format v2s2

cd $CURDIR