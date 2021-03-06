# Powercli: Container Image

## Current Version: PowerShell:`v7.2.0`

Dowonload ---> [[Quay.io](https://quay.io/repository/tnk4on/powercli): [![tnk4on/powercli on Quay.io](https://quay.io/repository/tnk4on/powercli/status "tnk4on/powercli on Quay.io")](https://quay.io/repository/tnk4on/powercli)] or [[Docker.io](https://hub.docker.com/r/tnk4on/powercli)]

[English](README.md) / [Japanese](README_ja.md)

- This repository assumes the use of [Podman](https://github.com/containers/podman) and [Buildah](https://github.com/containers/buildah). If you are using Docker, please read as appropriate.

## Description

- **PowerCLI**: A multi-platform scripting language to manage your VMware infrastructure on any OS. 

### Reference
- [VMware PowerCLI - VMware {code}](https://code.vmware.com/tool/vmware-powercli)
- [vmware/powerclicore: PowerCLI Core Dockerfile](https://github.com/vmware/powerclicore)
- [PowerShell/PowerShell: PowerShell for every system!](https://github.com/PowerShell/PowerShell)

## About container images

There are four types of container images depending on how they are built
- `tnk4on/powercli:latest,mcr-alpine-3.14` -> Base Image:`mcr.microsoft.com/powershell:mcr-alpine-3.14`
- `tnk4on/powercli:ubi8-minimal` -> Base Image:`ubi8-minimal:latest`
- `tnk4on/powercli:alpine-scratch` -> Base Image:`alpine:3.14`
- `tnk4on/powercli:photon` -> Base Image:`photon:4.0`

### Features

- Image size smaller than official VMware image([vmware/powerclicore](https://github.com/vmware/powerclicore))
- PowerCLI-Example-Scripts are not included
- `POWERSHELL_TELEMETRY_OPTOUT` is set to true

## How to use

```
$ podman run --rm -it tnk4on/powercli
```
Note: `CMD` is set to `pwsh` command. You can override the execution command by specifying the command as an argument.

## How to build a container image

```
$ git clone https://github.com/tnk4on/powercli
$ cd powercli/Containerfile.d
$ TYPE=mcr-alpine
$ buildah bud -t tnk4on/powercli -f Containerfile.${TYPE}
```
Note: `TYPE` is the name you want to build with (e.g. alpine-scratch)
- `TYPE`
    - alpine-scratch
    - mcr-alpine
    - photon
    - ubi8-minimal